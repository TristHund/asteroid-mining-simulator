import psycopg2
from config.db_config import db_config
import os

def get_db_connection():
    return psycopg2.connect(**db_config)

def read_sql_file(file_path):
    with open(file_path, 'r') as file:
        return file.read()

def get_csv_file(file_name, current_file):
    current_directory = os.path.dirname(current_file)
    csv_file_path = os.path.join(current_directory, file_name)
    return csv_file_path