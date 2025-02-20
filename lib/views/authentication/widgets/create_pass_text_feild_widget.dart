import 'package:flutter/material.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/utils/custom_widgets/custom_text.dart';

class CreatePassTextFeildWidget extends StatefulWidget {
  const CreatePassTextFeildWidget({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
  });
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  @override
  State<CreatePassTextFeildWidget> createState() =>
      _CreatePassTextFeildWidgetState();
}

class _CreatePassTextFeildWidgetState extends State<CreatePassTextFeildWidget> {
  bool obscureTextPass = true;
  bool obscureTextConPass = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            text: 'Enter password',
            color: AppColors.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w900,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 55,
          child: TextFormField(
            controller: widget.passwordController,
            obscureText: obscureTextPass,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Enter password',
              labelStyle: const TextStyle(fontSize: 14),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureTextPass ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    obscureTextPass = !obscureTextPass;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password cannot be empty';
              } else if (value.length < 8 ||
                  !RegExp(r'[!@#\$%\^&\*(),.?":{}|<>]').hasMatch(value)) {
                return 'Password must be at least 8 characters and include a special character';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            text: 'Re-enter password',
            color: AppColors.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w900,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 55,
          child: TextFormField(
            controller: widget.confirmPasswordController,
            obscureText: obscureTextConPass,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Re-enter password',
              labelStyle: const TextStyle(fontSize: 14),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureTextConPass ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    obscureTextConPass = !obscureTextConPass;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              } else if (value != widget.passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
