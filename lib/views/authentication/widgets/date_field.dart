import 'package:flutter/material.dart';

Widget dateField(BuildContext context, String label, TextEditingController controller, {String? Function(String?)? validator}) {
  return TextFormField(
    controller: controller,
    readOnly: true,
    validator: validator,
    decoration: InputDecoration(
      labelText: label,
      suffixIcon: IconButton(
        icon: const Icon(Icons.calendar_today),
        onPressed: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (pickedDate != null) {
            controller.text = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
          }
        },
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
