from scripts.load_power import load_power
from scripts.load_attitude_control import load_attitude_control

def main():
    filepath = input("Enter in a filepath: \n")
    #load_power(filepath)
    load_attitude_control(filepath)

if __name__ == "__main__":
    main()
