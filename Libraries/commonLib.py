from netmiko import ConnectHandler


def connection(ipv4Addr, port):
    devices = {
        "host": f"{ipv4Addr}",
        "port": port,
        "username": "danbo",
        "password": "danbo",
        "device_type": "arista_eos"
    }
    return ConnectHandler(**devices)

def close_connection(connection):
    return connection.disconnect()


if __name__ == "__main__":
    pass