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