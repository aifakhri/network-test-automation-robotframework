from netmiko import ConnectHandler


def open_connection(ipv4Addr, port, usernm, passwd, devType):
    devices = {
        "host": ipv4Addr,
        "port": port,
        "username": usernm,
        "password": passwd,
        "device_type": devType
    }
    return ConnectHandler(**devices)

def close_connection(connection):
    return connection.disconnect()