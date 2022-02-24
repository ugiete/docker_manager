from time import sleep
from source.models.service import DockerService
import subprocess
import socket

HOST = 'localhost'
PORT = 65432

CURRENT = -1

if __name__ == '__main__':
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
        sock.bind((HOST, PORT))
        sock.listen()

        conn, addr = sock.accept()

        with conn:
            print(f'Connected by {addr}')
            while True:
                try:
                    subprocess.check_output('systemctl status docker', shell=True)
                    if CURRENT != 1:
                        conn.sendall('1'.encode())
                        CURRENT = 1
                except subprocess.CalledProcessError:
                    if CURRENT != 0:
                        conn.sendall('0'.encode())
                        CURRENT = 0