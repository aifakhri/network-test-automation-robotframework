from netmiko import ConnectHandler


def connection(mgmtIpAddr):
    devices = {
        "host": f"{mgmtIpAddr}",
        "username": "danbo",
        "password": "danbo",
        "device_type": "arista_eos"
    }

    return ConnectHandler(**devices)

def close_connect(connection):
    return connection.disconnect()

if __name__ == "__main__":
    pass