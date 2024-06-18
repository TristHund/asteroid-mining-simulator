import unittest
import os
from scripts.load_power import load_power
from scripts.utils import get_db_connection, get_csv_file

class TestPowerLoad(unittest.TestCase):
    def setUp(self):
        self.conn = get_db_connection()
        self.cursor = self.conn.cursor()
        self.cursor.execute("DELETE FROM core.power; DELETE FROM core.components;")
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        print(components_count)
        self.cursor.execute("SELECT COUNT(*) FROM core.power;")
        power_count = self.cursor.fetchone()[0]
        print(power_count)


    def tearDown(self):
        self.cursor.close()
        self.conn.close()
    
    def test_load_power(self):
        load_power(get_csv_file('test_power.csv',os.path.abspath(__file__)))
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        print(components_count)
        self.cursor.execute("SELECT COUNT(*) FROM core.power;")
        power_count = self.cursor.fetchone()[0]
        print(power_count)
        self.assertGreater(components_count, 0)
        self.assertGreater(power_count, 0)
       
if __name__ == '__main__':
    unittest.main()
