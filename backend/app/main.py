from flask import Flask
from flask_cors import CORS
from app.routes.parts import parts

def create_app():
    app = Flask(__name__)
    CORS(app)
    app.register_blueprint(parts)
    return app

if __name__ == '__main__':
    app = create_app()
    app.run(debug=True)