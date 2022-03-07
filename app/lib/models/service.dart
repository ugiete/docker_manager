class Service {
  String containerID;
  String name;
  List<Map<String, String>> ports = [];
  String status;
  String createdAt;
  String? image;
  List<Map<String, String>> environments = [];
  List<Map<String, String>> volumes = [];

  Service(this.containerID, this.name, this.ports, this.status, this.createdAt);

  Service.fromJson(Map<String, dynamic> json)
      : containerID = json['container_id'],
        name = json['name'],
        ports = json['ports'],
        status = json['status'],
        createdAt = json['created_at'];

  Service.newService()
      : containerID = '',
        name = '',
        ports = [],
        status = '',
        createdAt = '';

  String get parsePort {
    String result = "";

    for (Map<String, String> port in ports) {
      result = result + "${port['host']} -> ${port['container']}\n";
    }

    return result.trim();
  }
}

class ServiceState {
  final List<Service> services;
  final bool loading;

  ServiceState(this.services, {this.loading = false});

  ServiceState.from(ServiceState state,
      {List<Service>? newServices, bool newLoading = false})
      : services = newServices ?? state.services,
        loading = newLoading;
}
