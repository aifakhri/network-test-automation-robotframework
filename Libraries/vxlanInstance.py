import json



def vxlan_status(connection, vxlan_interface_number):
    responses =  connection.send_command(f"show interface vxlan{vxlan_interface_number} | json")
    response = json.loads(responses)
    vxlan_status = response['interfaces']['Vxlan1']['lineProtocolStatus']
    # vxlan_status return string 'up'
    return vxlan_status

def vxlan_vni_mapping(connection, vxlan_interface_number):
    responses =  connection.send_command(f"show interface vxlan{vxlan_interface_number} | json")
    response = json.loads(responses)
    mapping = response['interfaces']['Vxlan1']['vlanToVniMap']['100']['vni']
    # mapping will return in integer, the 100 is the vlan it should be a variable
    # because there would be various VXLAN VLAN Service
    return mapping

def vxlan_control_plane(connection):
    responses = connection.send_command(f"show vxlan control-plane")
    response = json.loads(responses)
    ## Still unsure what to return
    return response

def vxlan_mac_address(connection, remote_server_vlan_macaddress):
    responses = connection.send_command(f"show mac address table address \
        {remote_server_vlan_macaddress} | section unicast")
    response = json.loads(responses)
    # Response could be more than 1, prepare if it a list or a dictionary
    mac_address = responses['unicastTable']['tableEntries']['macAddress']
    # vxlan_status return string of remote_device_mac_address
    return mac_address

def vxlan_evpn_service(connection, vni_number, remote_vtep_ip_address):
    responses = connection.send_command(f"show bgp evpn vni {vni_number} next-hop \
        {remote_vtep_ip_address} | json | section mac")
    response = json.loads(responses)
    # check mac address of remote device
    return response

def vxlan_vrf_arp_table(connection, vrf_name_irb_service):
    responses =  connection.send_command(f"show arp vrf {vrf_name_irb_service} | json")
    response = json.loads(responses)
    # mac address is in a list, make sure that it is the remote mac address that we want
    # the clue here is to match the ip address or use directly the mac address.
    mac_address = responses['ipV4Neighbors'][0]['hwAddress']
    return mac_address