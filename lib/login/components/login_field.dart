import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  const LoginField({super.key, required this.label, required this.controller});
  final String label;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), label: Text(label)),
      ),
    );
  }
}
