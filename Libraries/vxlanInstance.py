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