class Connection {
  String host;
  bool active = false;
  String? username;
  int? port;

  Connection(this.host);

  Connection.local() : host = 'localhost';

  Connection.from(Connection conn,
      {String? newHost, bool? newActive, String? newUsername, int? newPort})
      : host = newHost ?? conn.host,
        active = newActive ?? conn.active,
        username = newUsername ?? conn.username,
        port = newPort ?? conn.port;
}
