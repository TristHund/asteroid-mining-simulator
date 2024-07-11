from scripts.utils import load_data

columns_attitude_control = [
    "name",
    "type",
    "weight",
    "cost",
    "control_method",
    "sensor_types",
    "accuracy",
    "power_consumption",
    "operational_lifetime",
    "redundancy_level",
    "temperature_tolerance",
    "radiation_tolerance",
    "reliability",
]


def load_attitude_control(csv_file_path):
    load_data(
        csv_file_path, "./sql/load_attitude_control.sql", columns_attitude_control
    )
