import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:app/bloc/conn/conn_bloc.dart';
import 'package:app/bloc/conn/conn_events.dart';
import 'package:app/bloc/services/services_bloc.dart';
import 'package:app/bloc/services/services_events.dart';
import 'package:app/models/response.dart';
import 'package:app/models/service.dart';
import 'package:app/resources/environments.dart' as env;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ManagerSocket {
  final BuildContext context;
  Socket? _socket;

  ManagerSocket(this.context) {
    connect();
  }

  void connect() {
    Socket.connect(env.socketHost, env.socketPort).then((Socket socket) {
      _socket = socket;
      _socket?.listen((Uint8List response) => _parseResponse(response));
    }).onError((error, stackTrace) {
      Future.delayed(const Duration(seconds: 5), (() {
        print('error caused by: $error');
        connect();
      }));
    });
  }

  void disconnect() {
    _socket?.destroy();
    _socket = null;
  }

  void status() {
    _socket?.write("status");
  }

  void list() {
    _socket?.write("list");
  }

  void _parseResponse(Uint8List value) {
    String data = String.fromCharCodes(value);
    SocketResponse response = SocketResponse.fromJson(jsonDecode(data));

    switch (response.label) {
      case 'LIST':
        ServicesBloc bloc = context.read<ServicesBloc>();
        List<Service> services = [];

        for (var data in response.data) {
          Map<String, dynamic> json = data as Map<String, dynamic>;
          services.add(Service.fromJson(json));
        }

        bloc.add(ServicesListEvent(services));
        break;

      case 'STATUS':
        ConnectionBloc bloc = context.read<ConnectionBloc>();
        bloc.add(
            response.data ? ConnectionServiceUp() : ConnectionServiceDown());
        break;

      default:
        break;
    }
  }
}
