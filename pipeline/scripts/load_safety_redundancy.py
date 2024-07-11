from scripts.utils import load_data

columns_safety_redundancy_systems = [
    "name",
    "type",
    "weight",
    "cost",
    "system_type",
    "functionality",
    "operational_parameters",
    "reliability",
    "redundancy_level",
    "power_requirements",
    "operational_lifetime",
    "maintenance_frequency",
]


def load_safety_redundancy(csv_file_path):
    load_data(
        csv_file_path,
        "./sql/load_safety_redundancy.sql",
        columns_safety_redundancy_systems,
    )
