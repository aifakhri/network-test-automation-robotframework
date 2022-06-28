import json



def vxlan_bridged_mac_address(connection, remote_server_vlan_macaddress):
    responses = connection.send_command(f"show mac address table address \
        {remote_server_vlan_macaddress} | section unicast")
    response = json.loads(responses)
    # Response could be more than 1, prepare if it a list or a dictionary
    mac_address = responses['unicastTable']['tableEntries']['macAddress']
    # vxlan_status return string of remote_device_mac_address
    return mac_address

def vxlan_bridged_evpn_service(connection, vni_number, remote_vtep_ip_address):
    responses = connection.send_command(f"show bgp evpn vni {vni_number} next-hop \
        {remote_vtep_ip_address} | json | section mac")
    response = json.loads(responses)
    # check mac address of remote device
    return response