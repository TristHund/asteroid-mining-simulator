from scripts.utils import load_data

columns_coms = [
    'name', 'type', 'weight', 'cost', 'bandwidth', 'data_rate',
    'power_consumption', 'operational_lifetime', 'antenna_type',
    'eirp', 'redundancy_level'
]

def load_coms(csv_file_path):
    load_data(csv_file_path, './sql/load_coms.sql', columns_coms)

