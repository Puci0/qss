from flask import Flask, jsonify, request
import psycopg2
from psycopg2 import sql
import bcrypt
import logging

app = Flask(__name__)

DATABASE_URL = "postgres://postgres:postgres@postgres:5432/qss_db"

def get_conn():
    conn = psycopg2.connect(DATABASE_URL)
    return conn

@app.route('/login', methods=['POST'])
def login():
    credentials = request.get_json()

    email = credentials.get('email')
    password = credentials.get('password')

    conn = get_conn()
    cur = conn.cursor()
    query = sql.SQL("SELECT email,haslo FROM uzytkownik WHERE email = %s")
    cur.execute(query, (email,))

    user = cur.fetchone()
    conn.close()
    cur.close()

    if user:
        stored_email, stored_password = user

        if bcrypt.checkpw(password.encode('utf-8'), stored_password.encode('utf-8')):
            return jsonify({"message": "Login successful"}), 200
        else:
            return jsonify({"error": "Invalid credentials"}), 400
    else:
        return jsonify({"error": "User not found"}), 400

    # return jsonify({"email": email, "password": password})

@app.route('/register', methods=['POST'])
def register():
    user_data = request.get_json()

    name = user_data.get('name')
    surname = user_data.get('surname')
    email = user_data.get('email')
    password = user_data.get('password')
    confirm_password = user_data.get('confirmPassword')

    hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')

    conn = get_conn()
    cur = conn.cursor()


    cur.execute("SELECT email FROM uzytkownik WHERE email = %s", (email,))
    if cur.fetchone():
        return jsonify({"error": "Email already exists"}), 403

    try:
        cur.execute(
            "INSERT INTO uzytkownik (imie, nazwisko, email, haslo) VALUES (%s, %s, %s, %s)",
            (name, surname, email, hashed_password)
        )
        conn.commit()
        return jsonify({"message": "User registered successfully"}), 201
    except Exception as e:
        conn.rollback()
        return jsonify({"error": str(e)}), 500
    finally:
        cur.close()
        conn.close()

if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=8001)
