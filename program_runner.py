from robot import run_cli
from argparse import ArgumentParser
from os import listdir


# Constant
DEVICE_NAME = [device.strip(".yaml").lower() for device in listdir("Resources/Variables")]


#Parsing Command Line
test_parser = ArgumentParser(description="Test Runner Parser")
test_parser.add_argument("-d", "--device", default="all", \
    choices=DEVICE_NAME+['leaf', 'spine'], help="Please Select The Devices in The List")

args = test_parser.parse_args()

# Selecting which device should be run
for name in DEVICE_NAME:
    if args.device == "leaf" and args.device in name:
        device = f"DEVICE:{name}"
        run_cli(["-v", device, "-d", "Results/", "--splitlog", "Tests/"], exit=False)
    elif args.device == "spine" and args.device in name:
        device = f"DEVICE:{name}"
        run_cli(["-v", device, "-d", "Results/", "Tests/"], exit=False)
    elif args.device == "all" or name == args.device:
        device = f"DEVICE:{name}"
        run_cli(["-v", device, "-d", "Results/", "Tests/"], exit=False)