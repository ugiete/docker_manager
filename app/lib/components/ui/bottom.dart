import 'package:flutter/material.dart';

class InfoData {
  final String host;
  final bool serviceActive;
  final int servicesRunning;
  final bool hasNotifications;

  InfoData(this.host, this.serviceActive, this.servicesRunning,
      this.hasNotifications);
}

class AppBottom extends StatelessWidget {
  final InfoData data;
  final bool loading;

  const AppBottom({required this.data, this.loading = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        loading ? const LinearProgressIndicator() : Container(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          color:
              Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.6),
          height: 24.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HostStatus(data.host, data.serviceActive),
              ServicesStatus(data.servicesRunning, data.hasNotifications)
            ],
          ),
        ),
      ],
    );
  }
}

class HostStatus extends StatelessWidget {
  final String host;
  final bool serviceActive;

  const HostStatus(this.host, this.serviceActive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Tooltip(
            message: serviceActive ? 'Serviço Ativo' : 'Serviço Parado',
            child: Icon(Icons.circle,
                size: 14.0,
                color: serviceActive ? Colors.greenAccent : Colors.redAccent)),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child:
              Text(host, style: const TextStyle(fontWeight: FontWeight.bold)),
        )
      ],
    );
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
