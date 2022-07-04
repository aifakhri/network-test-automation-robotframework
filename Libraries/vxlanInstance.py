import json




def vxlan_status(connection, vxlanInt):
    responses =  connection.send_command(f"show interface {vxlanInt} | json")
    response = json.loads(responses)
    vxlan_status = response['interfaces'][f'{vxlanInt}']['lineProtocolStatus']
    return vxlan_status

def vxlan_vni_mapping(connection, vxlanInt, vlanId):
    responses =  connection.send_command(f"show interface {vxlanInt} | json")
    response = json.loads(responses)
    mapping = response['interfaces'][f'{vxlanInt}']['vlanToVniMap'][f'{vlanId}']['vni']
    return mapping

def vxlan_control_plane(connection, vlanId):
    responses = connection.send_command(f"show vxlan control-plane | json")
    response = json.loads(responses)
    control_plane = list(response["vlans"][f"{vlanId}"]['controlPlanes'].items())
    return control_plane[0][0]

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

if __name__ == "__main__":
    pass
    # devices = {
    #     "host": "172.16.1.22",
    #     "username": "danbo",
    #     "password": "danbo",
    #     "device_type": "arista_eos"
    # }
    # connection = ConnectHandler(**devices)
    # test = vxlan_control_plane(connection, "100")
    # print(test)
    