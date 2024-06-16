import os
from dotenv import load_dotenv

load_dotenv(os.path.join(os.path.dirname(__file__), '.env'))

db_config = {
        'dbname': os.getenv('DBNAME'),
        'user':  os.getenv('USER'),
        'password':  os.getenv('PASSWORD'),
        'host':  os.getenv('HOST'),
        'port':  os.getenv('PORT')
        }

