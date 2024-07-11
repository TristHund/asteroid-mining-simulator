from scripts.utils import load_data

columns_thermal_control_systems = [
    "comp_name",
    "comp_type",
    "comp_weight",
    "comp_cost",
    "system_type",
    "temperature_range",
    "power_consumption",
    "operational_lifetime",
    "reliability",
    "maintenance_requirements",
    "radiation_resistance",
]


def load_thermal_control_systems(csv_file_path):
    load_data(
        csv_file_path,
        "./sql/load_thermal_control_systems.sql",
        columns_thermal_control_systems,
    )
