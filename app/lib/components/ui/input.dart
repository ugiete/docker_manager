import 'package:flutter/material.dart';

class LabeledInput extends StatelessWidget {
  final String label;
  final String hint;
  final double width;
  final bool enabled;
  final TextEditingController? controller;

  const LabeledInput(
      {required this.label,
      required this.hint,
      required this.width,
      this.enabled = true,
      this.controller,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text('$label:',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
        ),
        SizedBox(
          width: width,
          child: TextField(
              controller: controller,
              enabled: enabled,
              decoration: InputDecoration(
                  hintText: hint,
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 14.0),
                  isDense: true)),
        )
      ],
    );
  }
}
