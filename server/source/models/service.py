class DockerService():
    """Class that abstracts docker service info
    """

    def __init__(self, data: str) -> None:
        info = data.split('\t')

        self.container_id = info[0].split('@')[-1]
        self.name = info[1].split('@')[-1]
        self.status = info[2].split('@')[-1]
        self.ports = info[3].split('@')[-1]
        self.created_at = info[4].split('@')[-1]
    
    def serialize(self) -> dict:
        return {
            "container_id": self.container_id,
            "name": self.name,
            "status": self.status,
            "ports": self.ports,
            "created_at": self.created_at
        }