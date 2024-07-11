from scripts.utils import load_data

columns_mining_equipment = [
    "name",
    "type",
    "weight",
    "cost",
    "efficiency",
    "power_consumption",
    "material",
    "reliability",
    "temperature_tolerance_min",
    "temperature_tolerance_max",
]


def load_mining_equipment(csv_file_path):
    load_data(
        csv_file_path,
        "./sql/load_mining_equipment.sql",
        columns_mining_equipment,
    )
