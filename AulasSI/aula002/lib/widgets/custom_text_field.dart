import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class CustomTexField extends StatelessWidget {
  final String hintText;
  final String label;
  final int lines;
  final void Function(String) onChanged;

  const CustomTexField(
      {required this.hintText,
      required this.label,
      this.lines = 1,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          maxLines: this.lines,
          minLines: this.lines,
          keyboardType: TextInputType.multiline,
          decoration:
              InputDecoration(hintText: this.hintText, label: Text(this.label)),
          onChanged: onChanged),
    );
  }
}