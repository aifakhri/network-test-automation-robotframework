import json



def bgp_evpn_neighbor_status(connection, peerIpv4):
    responses = connection.send_command(f"show bgp evpn summary | json ")
    response = json.loads(responses)
    bgp_peers = response["vrfs"]["default"]["peers"][peerIpv4]["peerState"]
    return bgp_peers

def bgp_evpn_prefix(connection, peerIpv4):
    responses = connection.send_command(f"show bgp evpn summary | json")
    response = json.loads(responses)
    prefix_count = response["vrfs"]["default"]["peers"][peerIpv4]["prefixReceived"]
    return prefix_count

def bgp_evpn_neighbor_caps(connection, peerIpv4):
    responses = connection.send_command(f"show ip bgp neighbors {peerIpv4} | json")
    response = json.loads(responses)
    bgp_caps = response["vrfs"]["default"]["peerList"][0] \
        ["neighborCapabilities"]['multiprotocolCaps']['l2VpnEvpn']
    return bgp_caps

def bgp_evpn_instance(connection, vlanId):
    responses = connection.send_command(f"show bgp evpn instance | json")
    response = json.loads(responses)
    instances = response['bgpEvpnInstances'][f"VLAN {vlanId}"]['vxlanEnabled']
    return instances


if __name__ == "__main__":
    pass