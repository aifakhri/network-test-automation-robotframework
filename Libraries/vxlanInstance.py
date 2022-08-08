import json
from netmiko import ConnectHandler



def vxlan_status(connection, vxlanInt):
    responses =  connection.send_command(f"show interface {vxlanInt} | json")
    response = json.loads(responses)
    vxlan_status = response['interfaces'][vxlanInt]['lineProtocolStatus']
    return vxlan_status

def vxlan_vni_mapping(connection, vxlanInt, vlanId):
    responses =  connection.send_command(f"show interface {vxlanInt} | json")
    response = json.loads(responses)
    mapping = response['interfaces'][f'{vxlanInt}']['vlanToVniMap'][f'{vlanId}']['vni']
    return mapping

def vxlan_mac_address(connection, vlanId, macAddr):
    responses = connection.send_command(f"show vxlan address-table | json")
    response = json.loads(responses)
    mac_table = response['addresses']
    for entry in mac_table:
        if entry["vlanId"] == int(vlanId) \
            and entry["macAddress"] == macAddr:
            return True

def vxlan_evpn_service(connection, vniId, rd, macAddr):
    macAddr = _transform_mac_address(macAddr)
    responses = connection.send_command(f"show bgp evpn vni {vniId} | json")
    response = json.loads(responses)
    mac_address = response['evpnRoutes'][f"RD: {rd} mac-ip {macAddr}"]["routeKeyDetail"]['mac']
    if mac_address == macAddr:
        return True

def vxlan_vrf_arp_table(connection, vrfName, macAddr):
    macAddr = _transform_mac_address(macAddr)
    responses =  connection.send_command(f"show arp vrf {vrfName} | json")
    response = json.loads(responses)
    arps = response['ipV4Neighbors']
    for arp in arps:
        if arp["hwAddress"] == macAddr:
            return True

def _transform_mac_address(macAddr):
    """
    Transforming Mac Address from this format: 
    00:0c:10:22:0f:a2
    To this format
    000c.1022.0fa2
    """
    mac_temp = ""
    oui_list = []
    for i, mac in enumerate(macAddr.split(":")):
        mac_temp += mac
        if i % 2 == 1:
            oui_list.append(mac_temp)
            mac_temp = ""
    return ".".join(oui_list)

if __name__ == "__main__":
    devices = {
        "host": "127.0.0.1",
        "port": "2221",
        "username": "danbo",
        "password": "danbo",
        "device_type": "arista_eos"
    }
    mac = "08:00:27:74:ae:8b"
    rd = "10.21.0.0:65102"
    vni = "1100"
    vlan = "100"
    connection = ConnectHandler(**devices)
    # test = vxlan_evpn_service(connection, "1200", "10.22.0.2:1200", mac)
    
    # test = vxlan_mac_address(connection, "100")
    test = vxlan_evpn_service(connection, vni, rd, mac)
    print(test)


    # print(vxlan_mac_address(connection, "100"))
    
    