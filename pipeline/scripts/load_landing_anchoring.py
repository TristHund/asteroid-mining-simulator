from scripts.utils import load_data

columns_landing_anchoring = [
    "name",
    "type",
    "weight",
    "cost",
    "strength",
    "material",
    "deployment_method",
    "power_consumption",
    "reliability",
]


def load_landing_anchoring(csv_file_path):
    load_data(
        csv_file_path,
        "./sql/load_landing.sql",
        columns_landing_anchoring,
    )
