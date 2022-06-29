from netmiko import ConnectHandler



def connection(ipAddr):
    devices = {
        "host": f"{ipAddr}",
        "username": "danbo",
        "password": "danbo",
        "device_type": "arista_eos"
    }

    return ConnectHandler(**devices)

def close_connect(connection):
    return connection.disconnect()