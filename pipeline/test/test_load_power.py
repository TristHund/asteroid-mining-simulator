import unittest
from scripts.load_power import load_power
from scripts.utils import get_db_connection, read_sql_file

class TestPowerLoad(unittest.TestCase):
    def setUp(self):
        self.conn = get_db_connection()
        self.cursor = self.conn.cursor()
        self.cursor.execute("DELETE FROM core.power; DELETE FROM core.components;")

    def tearDown(self):
        self.cursor.close()
        self.conn.close()
    
    def test_load_power(self):
        load_power()
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        self.cursor.execute("SELECT COUNT(*) FROM core.power;")
        power_count = self.cursor.fetchone()[0]
        self.assertGreater(components_count, 0)
        self.assertGreater(power_count, 0)
       
if __name__ == '__main__':
    unittest.main()