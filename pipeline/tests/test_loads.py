import os
import unittest

from scripts.load_attitude_control import load_attitude_control
from scripts.load_coms import load_coms
from scripts.load_landing_anchoring import load_landing_anchoring
from scripts.load_mining_equipment import load_mining_equipment
from scripts.load_power import load_power
from scripts.load_propulsion import load_propulsion
from scripts.load_refinement import load_refinement
from scripts.load_resource_storage import load_resource_storage
from scripts.load_safety_redundancy import load_safety_redundancy
from scripts.load_sample_return import load_sample_return
from scripts.load_scientific_instruments import load_scientific_instruments
from scripts.load_thermal_control_systems import load_thermal_control_systems
from scripts.utils import get_csv_file, get_db_connection


class TestLoaders(unittest.TestCase):
    def setUp(self):
        self.conn = get_db_connection()
        self.cursor = self.conn.cursor()
        self.cursor.execute(
            """
            DELETE FROM core.thermal_control_systems;
            DELETE FROM core.scientific_instruments;
            DELETE FROM core.sample_return;
            DELETE FROM core.safety_redundancy_systems;
            DELETE FROM core.resource_storage;
            DELETE FROM core.landing_anchoring;
            DELETE FROM core.mining_equipment;
            DELETE FROM core.power;
            DELETE FROM core.attitude_control;
            DELETE FROM core.communications;
            DELETE FROM core.components;
        """
        )
        self.conn.commit()

    def tearDown(self):
        self.cursor.close()
        self.conn.close()

    def test_load_attitude_control(self):
        load_attitude_control(
            get_csv_file("files/test_attitude_control.csv", os.path.abspath(__file__))
        )
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        self.cursor.execute("SELECT COUNT(*) FROM core.attitude_control;")
        ac_count = self.cursor.fetchone()[0]
        self.assertGreater(components_count, 0)
        self.assertGreater(ac_count, 0)

    def test_load_coms(self):
        load_coms(get_csv_file("files/test_coms.csv", os.path.abspath(__file__)))
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        self.cursor.execute("SELECT COUNT(*) FROM core.communications;")
        coms_count = self.cursor.fetchone()[0]
        self.assertGreater(components_count, 0)
        self.assertGreater(coms_count, 0)

    def test_load_landing_anchoring(self):
        load_landing_anchoring(
            get_csv_file("files/test_landing_anchoring.csv", os.path.abspath(__file__))
        )
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        self.cursor.execute("SELECT COUNT(*) FROM core.landing_anchoring;")
        landing_count = self.cursor.fetchone()[0]
        self.assertGreater(components_count, 0)
        self.assertGreater(landing_count, 0)

    def test_load_mining_equipment(self):
        load_mining_equipment(
            get_csv_file("files/test_mining_equipment.csv", os.path.abspath(__file__))
        )
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        self.cursor.execute("SELECT COUNT(*) FROM core.mining_equipment;")
        mining_count = self.cursor.fetchone()[0]
        self.assertGreater(components_count, 0)
        self.assertGreater(mining_count, 0)

    def test_load_power(self):
        load_power(get_csv_file("files/test_power.csv", os.path.abspath(__file__)))
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        self.cursor.execute("SELECT COUNT(*) FROM core.power;")
        power_count = self.cursor.fetchone()[0]
        self.assertGreater(components_count, 0)
        self.assertGreater(power_count, 0)

    def test_load_propulsion(self):
        load_power(get_csv_file("files/test_propulsion.csv", os.path.abspath(__file__)))
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        self.cursor.execute("SELECT COUNT(*) FROM core.propulsion;")
        power_count = self.cursor.fetchone()[0]
        self.assertGreater(components_count, 0)
        self.assertGreater(power_count, 0)

    def test_load_refinement(self):
        load_power(get_csv_file("files/test_refinement.csv", os.path.abspath(__file__)))
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        self.cursor.execute("SELECT COUNT(*) FROM core.refinement;")
        power_count = self.cursor.fetchone()[0]
        self.assertGreater(components_count, 0)
        self.assertGreater(power_count, 0)

    def test_load_resource_storage(self):
        load_resource_storage(
            get_csv_file("files/test_resource_storage.csv", os.path.abspath(__file__))
        )
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        self.cursor.execute("SELECT COUNT(*) FROM core.resource_storage;")
        storage_count = self.cursor.fetchone()[0]
        self.assertGreater(components_count, 0)
        self.assertGreater(storage_count, 0)

    def test_load_safety_redundancy_systems(self):
        load_safety_redundancy_systems(
            get_csv_file(
                "files/test_safety_redundancy_systems.csv", os.path.abspath(__file__)
            )
        )
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        self.cursor.execute("SELECT COUNT(*) FROM core.safety_redundancy_systems;")
        safety_count = self.cursor.fetchone()[0]
        self.assertGreater(components_count, 0)
        self.assertGreater(safety_count, 0)

    def test_load_sample_return(self):
        load_sample_return(
            get_csv_file("files/test_sample_return.csv", os.path.abspath(__file__))
        )
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        self.cursor.execute("SELECT COUNT(*) FROM core.sample_return;")
        sample_return_count = self.cursor.fetchone()[0]
        self.assertGreater(components_count, 0)
        self.assertGreater(sample_return_count, 0)

    def test_load_scientific_instruments(self):
        load_scientific_instruments(
            get_csv_file(
                "files/test_scientific_instruments.csv", os.path.abspath(__file__)
            )
        )
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        self.cursor.execute("SELECT COUNT(*) FROM core.scientific_instruments;")
        scientific_count = self.cursor.fetchone()[0]
        self.assertGreater(components_count, 0)
        self.assertGreater(scientific_count, 0)

    def test_load_thermal_control_systems(self):
        load_thermal_control_systems(
            get_csv_file(
                "files/test_thermal_control_systems.csv", os.path.abspath(__file__)
            )
        )
        self.cursor.execute("SELECT COUNT(*) FROM core.components;")
        components_count = self.cursor.fetchone()[0]
        self.cursor.execute("SELECT COUNT(*) FROM core.thermal_control_systems;")
        thermal_count = self.cursor.fetchone()[0]
        self.assertGreater(components_count, 0)
        self.assertGreater(thermal_count, 0)


if __name__ == "__main__":
    unittest.main()
