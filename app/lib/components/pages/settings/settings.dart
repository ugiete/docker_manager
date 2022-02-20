import 'package:app/components/layouts/default.dart';
import 'package:app/components/ui/input.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController hostCtrl = TextEditingController();
  final TextEditingController userCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Settings',
                  style:
                      TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
              ElevatedButton(
                  onPressed: () => print('save'), child: const Text('Save'))
            ],
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text('Connection',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(children: [
                LabeledInput(
                    label: 'Host',
                    hint: 'localhost',
                    width: 200.0,
                    controller: hostCtrl),
                const SizedBox(width: 50.0),
                LabeledInput(
                    label: 'User',
                    hint: 'admin',
                    width: 200.0,
                    controller: userCtrl),
                const SizedBox(width: 50.0),
                LabeledInput(
                    label: 'Port',
                    hint: '2376',
                    width: 100.0,
                    controller: userCtrl),
              ]))
        ]));
  }
}
