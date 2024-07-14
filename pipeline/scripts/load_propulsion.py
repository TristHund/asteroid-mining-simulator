from scripts.utils import load_data

columns_propulsion = [
    "name",
    "type",
    "weight",
    "cost",
    "thrust",
    "specific_impulse",
    "fuel_type",
    "operational_lifetime",
    "size",
    "maintenance_requirements",
    "reliability",
    "environmental_impact",
    "development_status",
    "fuel_storage_volume",
]


def load_propulsion(csv_file_path):
    load_data(csv_file_path, "./sql/load_propulsion.sql", columns_propulsion)
