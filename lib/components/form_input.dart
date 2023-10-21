import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  const FormInput(
      {Key? key,
      required this.label,
      required this.obscureText,
      required this.textEditingController,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: textEditingController,
          obscureText: obscureText,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(),
            enabledBorder: OutlineInputBorder(),
            border: OutlineInputBorder(),
          ),
          keyboardType: textInputType,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
