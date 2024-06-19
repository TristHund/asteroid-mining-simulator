import flask 
from app.utils.db import get_db_connection, run_select, load_sql

parts = flask.Blueprint('parts', __name__)

@parts.route('/api/parts', methods=['GET'])
def get_parts():
    
    parts_values = run_select(load_sql('parts.sql'))
    
    return flask.jsonify(parts_values)

@parts.route('/api/power-components', methods=['GET'])
def get_power_components():
    values = run_select(load_sql('power_components.sql'))
    return flask.jsonify(values)