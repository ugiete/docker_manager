import 'package:flutter/material.dart';

class LabeledInput extends StatelessWidget {
  final String label;
  final String hint;
  final double width;
  final bool enabled;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final String? initialValue;

  const LabeledInput(
      {required this.label,
      required this.hint,
      required this.width,
      this.enabled = true,
      this.controller,
      this.onChange,
      this.initialValue,
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
          child: TextFormField(
              initialValue: initialValue,
              controller: controller,
              enabled: enabled,
              onChanged:
                  onChange == null ? null : (String value) => onChange!(value),
              decoration: InputDecoration(
                  fillColor: enabled ? null : Colors.grey.shade200,
                  filled: !enabled,
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

class ClearInput extends StatelessWidget {
  final String hint;
  final double width;
  final bool enabled;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final String? initialValue;

  const ClearInput(
      {required this.hint,
      required this.width,
      this.enabled = true,
      this.controller,
      this.onChange,
      this.initialValue,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
          initialValue: initialValue,
          controller: controller,
          enabled: enabled,
          onChanged:
              onChange == null ? null : (String value) => onChange!(value),
          decoration: InputDecoration(
              fillColor: enabled ? null : Colors.grey.shade200,
              filled: !enabled,
              hintText: hint,
              border: const OutlineInputBorder(),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
              isDense: true)),
    );
  }
}
