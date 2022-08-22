import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextField extends HookWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.blueGrey,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.blueGrey,
        ),
        controller: controller,
      ),
    );
  }
}