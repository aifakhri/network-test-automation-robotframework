import json
from netmiko import ConnectHandler


def bgp_status(connection, bgpPeers):
    responses = connection.send_command("show bgp summary | json")
    response = json.loads(responses)
    
    peerState = response["vrfs"]["default"]["peers"][bgpPeers]['peerState']
    if peerState == "Established":
        return peerState
    else:
        return peerState

def bgp_routes(connection):
    responses = connection.send_command("show ip route summary | json")
    response = json.loads(responses)
    bgp_routes = response["vrfs"]["default"]["bgpCounts"]["bgpExternal"]
    return bgp_routes

if __name__ == "__main__":
    devices = {
        "host": "172.16.1.21",
        "username": "danbo",
        "password": "danbo",
        "device_type": "arista_eos"
    }

    connection = ConnectHandler(**devices)
    test = bgp_routes(connection)
    print(test)
    print(type(test))