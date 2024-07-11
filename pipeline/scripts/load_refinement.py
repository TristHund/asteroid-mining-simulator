from scripts.utils import load_data

columns_refinement = [
    "name",
    "type",
    "weight",
    "cost",
    "refinement_type",
    "processing_capacity",
    "efficiency",
    "power_consumption",
    "operational_lifetime",
    "reliability",
    "maintenance_requirements",
    "temperature_tolerance",
    "radiation_tolerance",
]


def load_refinement(csv_file_path):
    load_data(csv_file_path, "./sql/load_refinement.sql", columns_refinement)
