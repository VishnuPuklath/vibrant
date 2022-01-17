import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;

  TextFieldInput(
      {required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.all(8.0),
        filled: true,
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
