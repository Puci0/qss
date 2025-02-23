import psycopg2
from search_service import ElasticSearchService


database_url = "postgres://postgres:postgres@postgres:5432/qss_db"

conn = psycopg2.connect(database_url)
cursor = conn.cursor()

cursor.execute("""
SELECT 
    o.id_ogloszenia, 
    o.tytul, 
    o.opis, 
    o.data_utworzenia, 
    o.id_uzytkownika,
    k.nazwa AS kategoria, 
    p.nazwa AS podkategoria
FROM 
    ogloszenie o
JOIN 
    ogloszenie_podkategoria op ON o.id_ogloszenia = op.id_ogloszenia
JOIN 
    podkategoria p ON op.id_podkategorii = p.id_podkategorii
JOIN 
    kategoria_podkategoria kp ON p.id_podkategorii = kp.id_podkategorii
JOIN 
    kategoria k ON kp.id_kategorii = k.id_kategorii;
""")

rows = cursor.fetchall()
cursor.close()
conn.close()

es_service = ElasticSearchService()
es_service.create_index()
response = es_service.insert_documents(rows)
print(response)
es_service.close()
