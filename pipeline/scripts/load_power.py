from scripts.utils import load_data

columns_power = [
    "name",
    "type",
    "weight",
    "cost",
    "efficiency",
    "power_output",
    "temperature_tolerance_min",
    "temperature_tolerance_max",
    "degradation_rate",
    "advantages",
    "disadvantages",
]


def load_power(csv_file_path):
    load_data(csv_file_path, "./sql/load_power.sql", columns_power)
