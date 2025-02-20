import 'package:flutter/material.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/utils/custom_widgets/custom_text.dart';

Widget stepIndicator(String text, bool isActive, int index) {
  return Column(
    children: [
      CircleAvatar(
        radius: 12,
        backgroundColor: isActive ? AppColors.buttonColor : AppColors.lightTextColor,
        child: Center(child: CustomText(text: index.toString())),
      ),
      const SizedBox(height: 4),
      Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: isActive ? AppColors.buttonColor : AppColors.lightTextColor,
        ),
      ),
    ],
  );
}
