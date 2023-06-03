import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  BaseTextField({
    super.key,
    this.hintText,
    this.readOnly = false,
    this.keyboardType,
    this.onChanged,
  });
  String? hintText;
  TextInputType? keyboardType;

  final bool readOnly;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      keyboardType: keyboardType ?? TextInputType.number,
      autofocus: false,
      onChanged: onChanged,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintStyle: const TextStyle(fontSize: 18),
        fillColor: Colors.transparent,
        hintText: hintText == "0.0" ? "0.0 degree" : hintText,
        border: InputBorder.none,
      ),
    );
  }
}
