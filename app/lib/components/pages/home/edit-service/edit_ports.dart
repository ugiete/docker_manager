import 'package:app/components/ui/input.dart';
import 'package:flutter/material.dart';

class EditPorts extends StatelessWidget {
  final List<Map<String, String>> ports;
  final void Function(int?, bool?, bool?, String?) onChange;

  const EditPorts({required this.onChange, this.ports = const [], Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Ports',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: ports.asMap().keys.map((int index) {
                final Map<String, String> variable = ports[index];

                return Row(children: [
                  ClearInput(
                      hint: 'Host',
                      width: 250,
                      initialValue: variable['host'],
                      onChange: (String newName) {
                        onChange(index, null, true, newName);
                      }),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('='),
                  ),
                  ClearInput(
                      hint: 'Container',
                      width: 200,
                      initialValue: variable['container'],
                      onChange: (String newValue) {
                        onChange(index, null, false, newValue);
                      }),
                  IconButton(
                      onPressed: () {
                        onChange(index, false, null, null);
                      },
                      icon: const Icon(Icons.remove_circle_outline))
                ]);
              }).toList()),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: GestureDetector(
            child: const Text('New port forwarding',
                style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              onChange(null, true, null, null);
            },
          ),
        )
      ],
    );
  }
}
