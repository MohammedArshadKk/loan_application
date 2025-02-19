import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/utils/custom_widgets/custom_container.dart';
import 'package:loan_application/utils/custom_widgets/custom_text.dart';
import 'package:loan_application/views/authentication/widgets/bottom_app_bar_clipper.dart';

Widget signInBottomBar() {
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
            CustomText(
              text: 'Please enter your credentials',
              color: AppColors.textColor,
              fontSize: 20,
              fontWeight: FontWeight.w900,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25),
            Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                text: 'Mobile Number',
                color: AppColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w900,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CustomContainer(
                  height: 55,
                  width: 88,
                  borderColor: Border.all(color: AppColors.lightTextColor),
                  borderRadius: BorderRadius.circular(6),
                  child: Center(
                    child: CustomText(
                      text: '🇮🇳 +91',
                      color: AppColors.textColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Please enter your mobile no.',
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
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
            Expanded(
              child: SizedBox(
                height: 55,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter password',
                    labelStyle: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),

            GestureDetector(
              onTap: () {},
              child: CustomContainer(
                height: 50,
                width: double.infinity,
                color: AppColors.buttonColor,
                borderRadius: BorderRadius.circular(6),
                child: Center(
                  child: CustomText(
                    text: 'Sign In',
                    color: AppColors.secondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 35),
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: CustomText(
                  text: 'New to CreditSea? Create an account',
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
