import 'package:flutter/material.dart';

Widget textField(String label, String hint, TextEditingController controller, {String? Function(String?)? validator}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
 