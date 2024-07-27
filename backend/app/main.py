from routes.parts import parts
from flask import Flask
from flask_cors import CORS

# export FLASK_APP=app/main.py

def create_app():
    app = Flask(__name__)
    CORS(app)
    app.register_blueprint(parts)
    return app

if __name__ == '__main__':
    app = create_app()
    app.run(debug=True)
