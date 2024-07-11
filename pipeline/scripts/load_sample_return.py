from scripts.utils import load_data

columns_sample_return = [
    "name",
    "type",
    "weight",
    "cost",
    "storage_capacity_kg",
    "sealing_mechanism",
    "launch_mechanism",
    "re_entry_capability",
    "power_requirements",
    "operational_lifetime",
    "communication_system",
]


def load_sample_return(csv_file_path):
    load_data(
        csv_file_path, "./sql/load_sample_return.sql", columns_sample_return
    )
