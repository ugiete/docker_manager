from source.models.service import DockerService
import subprocess
import socket
import json

HOST = 'localhost'
PORT = 65432

def check_docker_status() -> bytes:
    try:
        subprocess.check_output('systemctl status docker', shell=True)
        return '1'.encode()
    except:
        return '0'.encode()

def process_service() -> DockerService:
    pass

def list_services() -> bytes:
    try:
        ps = subprocess.check_output('docker ps --format "@{{.ID}}\t@{{.Names}}\t@{{.Status}}\t@{{.Ports}}\t@{{.CreatedAt}}"', shell=True)
        services_data = ps.decode().strip().split('\n')
        services = [DockerService(data).serialize() for data in services_data]
        return json.dumps(services).encode()
    except Exception as e:
        return f'[]'.encode()


if __name__ == '__main__':
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
        sock.bind((HOST, PORT))
        sock.listen()

        conn, addr = sock.accept()

        with conn:
            print(f'Connected by {addr}')
            while True:
                data = conn.recv(1024)

                if not data:
                    break

                cmd = data.decode('ascii').strip().upper()

                if cmd == 'STATUS':
                    conn.sendall(check_docker_status())
                elif cmd == 'LIST':
                    conn.sendall(list_services())