import csv
from scripts.utils import get_db_connection, read_sql_file

def load_power(csv_file_path):
    conn = get_db_connection()
    cursor = conn.cursor()

    insert_sql = read_sql_file('./sql/load_power.sql')

    with open(csv_file_path, 'r') as csv_file:
        reader = csv.DictReader(csv_file)
        for row in reader:
            cursor.execute(
                insert_sql,
                (
                    row['name'],
                    row['type'],
                    row['weight'],
                    row['cost'],
                    row['efficiency'],
                    row['power_output'],
                    row['temperature_tolerance_min'],
                    row['temperature_tolerance_max'],
                    row['degredation_rate'],
                    row['advantages'],
                    row['disadvantages']
                )
            )

    conn.commit()
    cursor.close()
    conn.close()

