from scripts.utils import load_data

columns_scientific_instruments = [
    "name",
    "type",
    "weight",
    "cost",
    "instrument_type",
    "sensitivity",
    "resolution",
    "power_consumption",
    "operational_lifetime",
    "data_rate",
    "field_of_view",
    "temperature_tolerance_min",
    "temperature_tolerance_max",
]


def load_scientific_instruments(csv_file_path):
    load_data(
        csv_file_path,
        "./sql/load_scientific_instruments.sql",
        columns_scientific_instruments,
    )
