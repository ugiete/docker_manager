import 'package:flutter/material.dart';

class SwitchOption extends StatefulWidget {
  final String label;
  final bool initialValue;

  const SwitchOption(
      {required this.label, required this.initialValue, Key? key})
      : super(key: key);

  @override
  _SwitchOptionState createState() => _SwitchOptionState();
}

class _SwitchOptionState extends State<SwitchOption> {
  late bool currentValue;

  @override
  void initState() {
    currentValue = widget.initialValue;
    super.initState();
  }

  void updateValue(bool newValue) {
    setState(() {
      currentValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text('${widget.label}:',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
        ),
        Switch(value: currentValue, onChanged: updateValue)
      ],
    );
  }
}
