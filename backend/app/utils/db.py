import os

import psycopg2
from app.config.db_config import db_config
from psycopg2.extras import RealDictCursor


def get_db_connection():
    return psycopg2.connect(**db_config, cursor_factory=RealDictCursor)


def run_select(query):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute(query)
    values = cur.fetchall()
    cur.close()
    conn.close()
    return values


def load_sql(filename):
    current_path = os.path.dirname(__file__)
    pardir, curdir = os.path.split(current_path)
    with open(os.path.join(pardir, "sql", filename), "r") as file:
        return file.read()
