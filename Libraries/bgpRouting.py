import json





def get_bgp_status(connection):
    responses = connection.send_command("show bgp summary | json")
    response = json.loads(responses)
    bgp_peers = response["vrfs"]["default"]["peers"]['10.1.1.0']
    return bgp_peers

def get_bgp_routes(connection):
    responses = connection.send_command("show bgp summary | json")
    response = json.loads(responses)
    bgp_routes = response["vrfs"]["default"]["bgpCounts"]["bgpExternal"]
    return bgp_routes    

if __name__ == "__main__":
    print(get_bgp_status())