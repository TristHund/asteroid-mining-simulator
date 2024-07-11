from scripts.utils import load_data

columns_resource_storage = [
    "name",
    "type",
    "weight",
    "cost",
    "storage_type",
    "capacity_kg",
    "volume_m3",
    "material_type",
    "sealed",
    "temperature_control",
    "operational_lifetime",
    "radiation_shielding",
]


def load_resource_storage(csv_file_path):
    load_data(
        csv_file_path,
        "./sql/load_resource_storage.sql",
        columns_resource_storage,
    )
