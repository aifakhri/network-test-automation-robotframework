import json



def vxlan_irb_mac_address(connection, remote_server_vlan_macaddress):
    responses =  connection.send_command("show mac address table address \
        {remote_server_vlan_macaddress} | section unicast")
    response = json.loads(responses)
    # Response could be more than 1, prepare if it a list or a dictionary
    mac_address = responses['unicastTable']['tableEntries']['macAddress']
    # vxlan_status return string of remote_device_mac_address
    return mac_address

def vxlan_bridged_evpn_service(connection, vni_number, remote_vtep_ip_address):
    responses =  connection.send_command("show bgp evpn vni {vni_number} next-hop \
        {remote_vtep_ip_address} | json | section mac")
    response = json.loads(responses)
    #Check the mac address
    return response

def get_mac_address_on_arp_table(connection, vrf_name_irb_service):
    responses =  connection.send_command(f"show arp vrf {vrf_name_irb_service} | json")
    response = json.loads(responses)
    # mac address is in a list, make sure that it is the remote mac address that we want
    # the clue here is to match the ip address or use directly the mac address.
    mac_address = responses['ipV4Neighbors'][0]['hwAddress']
    return mac_address