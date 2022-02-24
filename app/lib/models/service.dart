class ServiceModel {
  String containerID;
  String name;
  String ports;
  String status;
  String createdAt;

  ServiceModel(
      this.containerID, this.name, this.ports, this.status, this.createdAt);

  ServiceModel.newService()
      : containerID = '',
        name = '',
        ports = '',
        status = '',
        createdAt = '';
}
