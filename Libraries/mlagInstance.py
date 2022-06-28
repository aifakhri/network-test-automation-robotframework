import json



def mlag_state(connection):
    responses =  connection.send_command("show mlag")
    response = json.loads(responses)
    mlag_state = responses['state']
    # mlag state will directly return its state
    return mlag_state

def mlag_negotiation_state(connection):
    responses =  connection.send_command("show mlag | json")
    response = json.loads(responses)
    mlag_state = response['negStatus']
    # mlag state will directly return its negotation status
    return mlag_state

def get_mlag_member_status(connection):
    responses =  connection.send_command("show bgp summary | json")
    response = json.loads(responses)
    member_state = responses['interfaces']['100']['status']
    # mlag member could be many, we need to be anticipate if there are many mlag member
    # it could be a list, or a dictionaries. The output is a straight forward string
    return member_state