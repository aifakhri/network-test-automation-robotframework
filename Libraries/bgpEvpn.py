import json





def bgp_evpn_neighbor_status(connection, bgp_evpn_neighbor_ip_address):
    responses = connection.send_command(f"show bgp evpn summary | json | section \
        {bgp_evpn_neighbor_ip_address}")
    response = json.loads(responses)
    bgp_peers = response["vrfs"]["default"]["peers"]['10.1.1.0']
    return bgp_peers

def bgp_evpn_prefix(connection, bgp_evpn_neighbor_ip_address):
    responses = connection.send_command(f"show bgp evpn summary | json | section \
        {bgp_evpn_neighbor_ip_address}")
    response = json.loads(responses)
    bgp_routes = response["vrfs"]["default"]["bgpCounts"]["bgpExternal"]
    return bgp_routes

def bgp_evpn_route_advertisement(connection, bgp_evpn_neighbor_ip_address):
    responses = connection.send_command(f"show ip bgp neighbors {{bgp_evpn_neighbor_ip_address}} \
        | json | section l2vpnEvpn")    
    bgp_caps = responses["vrfs"]["default"]["peerList"][0]["neighborCapabilities"]['multiprotocolCaps']['l2VpnEvpn']
    return bgp_caps

def bgp_evpn_instance(connection):
    responses = connection.send_command(f"show bgp evpn instance")
    instances = responses['bgpEvpnInstances']['VLAN 100']['vxlanEnabled']
    return instances