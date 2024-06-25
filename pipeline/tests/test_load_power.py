import unittest
import os
from scripts.load_power import load_power
from scripts.load_attitude_control import load_attitude_control
from scripts.utils import get_db_connection, get_csv_file
from scripts.load_coms import load_coms

class TestPowerLoad(unittest.TestCase):
    def setUp(self):
        self.conn = get_db_connection()
        self.cursor = self.conn.cursor()
        self.cursor.execute("DELETE FROM core.power; DELETE FROM core.attitude_control; DELETE FROM core.communications; DELETE FROM core.components;")
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
        
    def test_load_attitude_control(self):
        load_attitude_control(get_csv_file('test_attitude_control.csv',os.path.abspath(__file__)))
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        print(components_count)
        self.cursor.execute("SELECT COUNT(*) FROM core.attitude_control;")
        ac_count = self.cursor.fetchone()[0]
        print(ac_count)
        self.assertGreater(components_count, 0)
        self.assertGreater(ac_count, 0)
    
    def test_load_coms(self):
        load_coms(get_csv_file('test_coms.csv',os.path.abspath(__file__)))
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        print(components_count)
        self.cursor.execute("SELECT COUNT(*) FROM core.communications;")
        ac_count = self.cursor.fetchone()[0]
        print(ac_count)
        self.assertGreater(components_count, 0)
        self.assertGreater(ac_count, 0)
          
if __name__ == '__main__':
    unittest.main()
