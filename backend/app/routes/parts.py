import flask
from utils.db import get_db_connection, load_sql, run_select

parts = flask.Blueprint("parts", __name__)


@parts.route("/api/parts", methods=["GET"])
def get_parts():
    parts_values = run_select(load_sql("parts.sql"))
    return flask.jsonify(parts_values)


@parts.route("/api/power-components", methods=["GET"])
def get_power_components():
    values = run_select(load_sql("power.sql"))
    return flask.jsonify(values)

@parts.route("/api/attitude-control-components", methods=["GET"])
def get_attitude_control_components():
    values = run_select(load_sql("attitude_control.sql"))
    return flask.jsonify(values)

@parts.route("/api/communications-components", methods=["GET"])
def get_communications_control_components():
    values = run_select(load_sql("coms.sql"))
    return flask.jsonify(values)

@parts.route("/api/landing-anchoring", methods=["GET"])
def get_landing_anchoring():
    values = run_select(load_sql("landing_anchoring.sql"))
    return flask.jsonify(values)

@parts.route("/api/mining-equipment", methods=["GET"])
def get_mining_equipment():
    values = run_select(load_sql("mining_equipment.sql"))
    return flask.jsonify(values)

@parts.route("/api/propulsion", methods=["GET"])
def get_propulsion_part():
    values = run_select(load_sql("propulsion.sql"))
    return flask.jsonify(values)

@parts.route("/api/refinement", methods=["GET"])
def get_refinement_part():
    values = run_select(load_sql("refinement.sql"))
    return flask.jsonify(values)

@parts.route("/api/resource-storage", methods=["GET"])
def get_resource_storage_part():
    values = run_select(load_sql("resource_storage.sql"))
    return flask.jsonify(values)

@parts.route("/api/safety-redundancy-systems", methods=["GET"])
def get_safety_redundancy_systems_part():
    values = run_select(load_sql("safety_redundancy_systems.sql"))
    return flask.jsonify(values)

@parts.route("/api/sample-return", methods=["GET"])
def get_sample_return_part():
    values = run_select(load_sql("sample_return.sql"))
    return flask.jsonify(values)

# scientific_instruments
@parts.route("/api/scientific-instruments", methods=["GET"])
def get_scientific_instruments():
    values = run_select(load_sql("scientific_instruments.sql"))
    return flask.jsonify(values)

# thermal_control_systems
@parts.route("/api/thermal-control-systems", methods=["GET"])
def get_thermal_control_systems():
    values = run_select(load_sql("thermal_control_systems.sql"))
    return flask.jsonify(values)

