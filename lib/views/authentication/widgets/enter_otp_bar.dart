import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/utils/custom_widgets/custom_container.dart';
import 'package:loan_application/utils/custom_widgets/custom_text.dart';
import 'package:loan_application/views/authentication/widgets/bottom_app_bar_clipper.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

Widget enterOtpBar(int index, Function() nextStep, Function() prevStep) {
  String otp = '';
  return ClipPath(
    clipper: BottomAppBarClipper(),
    child: BottomAppBar(
      color: AppColors.secondaryColor,
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    prevStep();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: CustomText(
                    text: 'Enter OTP',
                    color: AppColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                text: 'Verify OTP, Sent on +91 8800642354 ',
                color: AppColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w900,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 25),
            OtpTextField(
              numberOfFields: 4,
              showFieldAsBox: true,
              onSubmit: (String value) {
                otp = value;
              },
            ),
            SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                log(otp);
                nextStep();
              },
              child: CustomContainer(
                height: 50,
                width: double.infinity,
                color: AppColors.buttonColor,
                borderRadius: BorderRadius.circular(6),
                child: Center(
                  child: CustomText(
                    text: 'Verify',
                    color: AppColors.secondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 35),
          ],
        ),
      ),
    ),
  );
}
