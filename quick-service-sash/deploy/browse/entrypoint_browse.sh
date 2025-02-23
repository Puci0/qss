#!/bin/sh

echo "Running load_data.py"
python load_data.py

echo "Starting app.py"
exec python app.py
