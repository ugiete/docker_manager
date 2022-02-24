import subprocess

try:
    subprocess.check_output('systemctl status docker', shell=True)
    print('Serviço ativo')
except subprocess.CalledProcessError:
    print('Serviço parado')
