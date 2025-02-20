import 'package:flutter/material.dart';

Widget dropdown(
  String label,
  List<String> items, {
  String? Function(String?)? validator,
}) {
  return DropdownButtonFormField(
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
    items:
        items.map((String item) {
          return DropdownMenuItem(value: item, child: Text(item));
        }).toList(),
    onChanged: (value) {},
    validator: validator,
  );
}
