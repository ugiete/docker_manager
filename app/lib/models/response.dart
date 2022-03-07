class SocketResponse {
  final String label;
  final dynamic data;

  SocketResponse(this.label, this.data);

  SocketResponse.fromJson(Map<String, dynamic> json)
      : label = json['label'],
        data = json['data'];
}
