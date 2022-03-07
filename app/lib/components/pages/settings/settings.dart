import 'package:app/bloc/conn/conn_bloc.dart';
import 'package:app/bloc/conn/conn_events.dart';
import 'package:app/components/layouts/default.dart';
import 'package:app/components/ui/image_button.dart';
import 'package:app/components/ui/input.dart';
import 'package:app/components/ui/switch_option.dart';
import 'package:app/models/conn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  static const String route = '/settings';

  final TextEditingController hostCtrl = TextEditingController();
  final TextEditingController userCtrl = TextEditingController();
  final TextEditingController portCtrl = TextEditingController();

  void onSave(ConnectionBloc bloc) {
    bloc.add(ConnectionSetHost(hostCtrl.text));
    bloc.add(ConnectionSetUsername(userCtrl.text));
    bloc.add(ConnectionSetPort(int.tryParse(portCtrl.text)));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: 'Settings',
        currentMenu: 2,
        action: BlocBuilder<ConnectionBloc, Connection>(
            builder: (BuildContext context, Connection state) {
          return ElevatedButton(
              onPressed: () => onSave(context.read<ConnectionBloc>()),
              child: const Text('Save'));
        }),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text('Connection',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: BlocBuilder<ConnectionBloc, Connection>(
                      builder: (BuildContext context, Connection state) {
                    hostCtrl.value = TextEditingValue(text: state.host);
                    userCtrl.value =
                        TextEditingValue(text: state.username ?? '');
                    portCtrl.value =
                        TextEditingValue(text: state.port?.toString() ?? '');

                    return ConnectionEditPanel(
                        hostCtrl: hostCtrl,
                        userCtrl: userCtrl,
                        portCtrl: portCtrl);
                  })),
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Text('Preferences',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
              ),
              const SwitchOption(label: 'Light Theme', initialValue: true),
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: I18nPanel(),
              )
            ]));
  }
}

class ConnectionEditPanel extends StatelessWidget {
  final TextEditingController hostCtrl;
  final TextEditingController userCtrl;
  final TextEditingController portCtrl;

  const ConnectionEditPanel(
      {required this.hostCtrl,
      required this.userCtrl,
      required this.portCtrl,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      LabeledInput(
          label: 'Host', hint: 'localhost', width: 200.0, controller: hostCtrl),
      const SizedBox(width: 50.0),
      LabeledInput(
          label: 'User', hint: 'admin', width: 200.0, controller: userCtrl),
      const SizedBox(width: 50.0),
      LabeledInput(
          label: 'Port', hint: '2376', width: 100.0, controller: portCtrl),
    ]);
  }
}

class I18nPanel extends StatelessWidget {
  const I18nPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Internationalization',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              ImageButton(
                  image: const AssetImage('assets/flags/brazil.png'),
                  onTap: () => print('olá'),
                  size: const Size(70.0, 70.0)),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ImageButton(
                    image: const AssetImage('assets/flags/usa.png'),
                    onTap: () => print('olá'),
                    size: const Size(70.0, 70.0)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
