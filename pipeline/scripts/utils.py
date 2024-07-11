import psycopg2
from config.db_config import db_config
import os
import csv

def get_db_connection():
    return psycopg2.connect(**db_config)

def read_sql_file(file_path):
    with open(file_path, 'r') as file:
        return file.read()

def get_csv_file(file_name, current_file):
    current_directory = os.path.dirname(current_file)
    csv_file_path = os.path.join(current_directory, file_name)
    return csv_file_path

def load_data(csv_file_path, sql_file_path, columns):
    conn = get_db_connection()
    cursor = conn.cursor()

    insert_sql = read_sql_file(sql_file_path)
    print(insert_sql)

    with open(csv_file_path, 'r') as csv_file:
        reader = csv.DictReader(csv_file)
        for row in reader:
            sql_with_values = insert_sql % tuple(row[col] for col in columns)
            print(sql_with_values)
            cursor.execute(sql_with_values)

    conn.commit()
    cursor.close()
    conn.close()

