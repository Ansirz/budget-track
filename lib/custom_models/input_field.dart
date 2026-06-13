import 'package:flutter/material.dart';
class InputField extends StatelessWidget {
  final String label;
  final Icon suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  const InputField({
    super.key,
    required this.label,
    required this.suffixIcon,
    required this.controller,
    required this.keyboardType
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.0,
      child: TextField(
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
       floatingLabelStyle: TextStyle(fontSize: 20),
       floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: suffixIcon,
border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 1.2)
          ),
          label: Text(
           label,
           style: TextStyle(color: Colors.grey),
          )
        ),
      ),
    );
  }
}