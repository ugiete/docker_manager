abstract class ConnectionEventBloc {}

class ConnectionServiceDown extends ConnectionEventBloc {}

class ConnectionServiceUp extends ConnectionEventBloc {}

class ConnectionSetHost extends ConnectionEventBloc {
  final String host;

  ConnectionSetHost(String newHost)
      : host = newHost.isEmpty ? 'localhost' : newHost;
}

class ConnectionSetUsername extends ConnectionEventBloc {
  final String? username;

  ConnectionSetUsername(this.username);
}

class ConnectionSetPort extends ConnectionEventBloc {
  final int? port;

  ConnectionSetPort(this.port);
}
