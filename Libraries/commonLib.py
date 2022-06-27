from netmiko import ConnectHandler



def connection():
    devices = {
        "host": "172.16.1.21",
        "username": "danbo",
        "password": "danbo",
        "device_type": "arista_eos"
    }

    return ConnectHandler(**devices)

def close_connect(connection):
    return connection.disconnect()