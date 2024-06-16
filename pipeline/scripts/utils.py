import psycopg2
from config.db_config import db_config

def get_db_connection():
    return psycopg2.connect(**db_config)

def read_sql_file(file_path):
    with open(file_path, 'r') as file:
        return file.read()
