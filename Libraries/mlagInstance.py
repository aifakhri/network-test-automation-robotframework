import json
from netmiko import ConnectHandler



def mlag_state(connection):
    responses =  connection.send_command("show mlag | json")
    response = json.loads(responses)
    mlag_state = response['state']
    return mlag_state

def mlag_negotiation_state(connection):
    responses =  connection.send_command("show mlag | json")
    response = json.loads(responses)
    mlag_state = response['negStatus']
    # mlag state will directly return its negotation status
    return mlag_state

def mlag_member_status(connection, memberId):
    responses =  connection.send_command("show mlag interfaces | json")
    response = json.loads(responses)
    member_state = response['interfaces'][memberId]['status']
    # mlag member could be many, we need to be anticipate if there are many mlag member
    # it could be a list, or a dictionaries. The output is a straight forward string
    return member_state

if __name__ == "__main__":
    devices = {
        "host": "172.16.1.22",
        "username": "danbo",
        "password": "danbo",
        "device_type": "arista_eos"
    }

    connection = ConnectHandler(**devices)
    print(mlag_negotiation_state(connection))