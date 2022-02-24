class DockerService():
    """Class that abstracts docker service info
    """

    def __init__(self) -> None:
        self.container_id = ''
        self.name = ''
        self.status = ''
        self.ports = ''
        self.created_at = ''
    
    def serialize(self) -> dict:
        return {
            "container_id": self.container_id,
            "name": self.name,
            "status": self.status,
            "ports": self.ports,
            "created_at": self.created_at
        }