import 'package:app/bloc/conn/conn_bloc.dart';
import 'package:app/models/conn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoData {
  final int servicesRunning;
  final bool hasNotifications;

  InfoData(this.servicesRunning, this.hasNotifications);
}

class AppBottom extends StatelessWidget {
  final InfoData data;

  const AppBottom({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //cond ? const LinearProgressIndicator() : Container(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          color:
              Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.6),
          height: 24.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HostStatus(),
              ServicesStatus(data.servicesRunning, data.hasNotifications)
            ],
          ),
        ),
      ],
    );
  }
}

class HostStatus extends StatelessWidget {
  const HostStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionBloc, Connection>(
        builder: (BuildContext context, Connection state) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Tooltip(
              message: state.active ? 'Serviço Ativo' : 'Serviço Parado',
              child: Icon(Icons.circle,
                  size: 14.0,
                  color: state.active ? Colors.greenAccent : Colors.redAccent)),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(state.host,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          )
        ],
      );
    });
  }
}

class ServicesStatus extends StatelessWidget {
  final int servicesRunning;
  final bool hasNotifications;

  const ServicesStatus(this.servicesRunning, this.hasNotifications, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Serviços rodando: $servicesRunning'),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Icon(
              hasNotifications ? Icons.notifications : Icons.notifications_none,
              size: 16.0),
        )
      ],
    );
  }
}
