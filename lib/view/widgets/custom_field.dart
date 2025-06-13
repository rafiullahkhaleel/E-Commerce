import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? emptyError;
  const CustomField({
    super.key,
    required this.labelText,
    this.controller,
    this.keyboardType,
    this.emptyError,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      validator: (value) {
        if (value!.isEmpty) {
          return emptyError;
        } else {
          return null;
        }
      },
    );
  }
}
