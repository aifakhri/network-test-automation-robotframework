import json



def bgp_status(connection, bgpPeers):
    responses = connection.send_command("show bgp summary | json")
    response = json.loads(responses)
    
    peer_state = response["vrfs"]["default"]["peers"][bgpPeers]['peerState']
    return peer_state

def bgp_routes(connection):
    responses = connection.send_command("show ip route summary | json")
    response = json.loads(responses)
    bgp_routes = response["vrfs"]["default"]["bgpCounts"]["bgpExternal"]
    return bgp_routes