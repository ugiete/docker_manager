from source.models.service import DockerService
import subprocess
import socket
import json

HOST = 'localhost'
PORT = 65432

def check_docker_status(label: str) -> bytes:
    try:
        subprocess.check_output('systemctl status docker', shell=True)
        return format_response(label, True)
    except:
        return format_response(label, False)

def list_services(label: str) -> bytes:
    try:
        ps = subprocess.check_output('docker ps --format "@{{.ID}}\t@{{.Names}}\t@{{.Status}}\t@{{.Ports}}\t@{{.CreatedAt}}"', shell=True)
        services_data = ps.decode().strip().split('\n')
        services = [DockerService(data).serialize() for data in services_data]
        return format_response(label, services)
    except Exception as e:
        return format_response(label, [])

def list_images(label: str) -> bytes:
    try:
        ps = subprocess.check_output("docker image ls | awk '!/none/' | awk '{print($1, $2)}'", shell=True)
        images = ps.decode().strip().split('\n')[1:]
        return format_response(label, images)
    except Exception as e:
        return format_response(label, [])

def format_response(label: str, data) -> bytes:
    response = {
        "label": label,
        "data": data
    }

    return json.dumps(response).encode()

if __name__ == '__main__':
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
        sock.bind((HOST, PORT))
        sock.listen()

        conn, addr = sock.accept()

        with conn:
            while True:
                data = conn.recv(1024)

                if not data:
                    break

                cmd = data.decode('ascii').strip().upper()

                if cmd == 'STATUS':
                    conn.sendall(check_docker_status(cmd))
                elif cmd == 'LIST':
                    conn.sendall(list_services(cmd))
                elif cmd == 'IMAGES':
                    conn.sendall(list_images(cmd))