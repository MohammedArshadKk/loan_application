import 'package:flutter/material.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/utils/custom_widgets/custom_container.dart';
import 'package:loan_application/utils/custom_widgets/custom_text.dart';
import 'package:loan_application/views/authentication/widgets/bottom_app_bar_clipper.dart';

Widget createPassword(int index, Function() nextStep, Function() prevStep) {
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
                    text: 'Create a password',
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
                text: 'Enter password',
                color: AppColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w900,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(width: 25),
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
            Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                text: 'Re enter password',
                color: AppColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w900,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(width: 25),
            Expanded(
              child: SizedBox(
                height: 55,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Re enter password',
                    labelStyle: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text:
                      '*your password must include at least 8 characters,\n inclusive of alt least 1 special character',
                  textAlign: TextAlign.start,
                  color: AppColors.textColor,
                  fontSize: 13,
                ),
              ],
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
                    text: 'Proceed',
                    color: AppColors.secondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
