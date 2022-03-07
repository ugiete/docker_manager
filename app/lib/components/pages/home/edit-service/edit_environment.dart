import 'package:app/components/ui/input.dart';
import 'package:flutter/material.dart';

class EditEnvironment extends StatelessWidget {
  final List<Map<String, String>> variables;
  final void Function(int?, bool?, bool?, String?) onChange;

  const EditEnvironment(
      {required this.onChange, this.variables = const [], Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Environment Variables',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: variables.asMap().keys.map((int index) {
                final Map<String, String> variable = variables[index];

                return Row(children: [
                  ClearInput(
                      hint: 'Variable ${index + 1}',
                      width: 250,
                      initialValue: variable['name'],
                      onChange: (String newName) {
                        onChange(index, null, true, newName);
                      }),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('='),
                  ),
                  ClearInput(
                      hint: 'Variable value',
                      width: 200,
                      initialValue: variable['value'],
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
            child: const Text('New variable',
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
