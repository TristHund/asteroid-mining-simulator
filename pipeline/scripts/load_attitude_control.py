import csv
from scripts.utils import get_db_connection, read_sql_file

def load_attitude_control(csv_file_path):
    conn = get_db_connection()
    cursor = conn.cursor()

    insert_sql = read_sql_file('./sql/load_attitude_control.sql')
    print(insert_sql)

    with open(csv_file_path, 'r') as csv_file:
        reader = csv.DictReader(csv_file)
        for row in reader:
            sql_with_values = insert_sql % (
                    row['name'],
                    row['type'],
                    row['weight'],
                    row['cost'],
                    row['control_method'],
                    row['sensor_types'],
                    row['accuracy'],
                    row['power_consumption'],
                    row['operational_lifetime'],
                    row['redundancy_level'],
                    row['temperature_tolerance'],
                    row['radiation_tolerance'],
                    row['reliability']
            )

            print (sql_with_values)

            cursor.execute(sql_with_values)

    conn.commit()
    cursor.close()
    conn.close()

