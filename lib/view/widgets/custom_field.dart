import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  const CustomField({super.key, required this.labelText, this.controller, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:keyboardType ,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
