import 'package:flutter/widgets.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/utils/custom_widgets/custom_text.dart';

Widget phoneNumberRegisterContentWidget() {
  return Column(
    children: [
      Align(
        alignment: Alignment.center,
        child: Image.asset('assets/images/Frame 1.png'),
      ),
      Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: CustomText(
            text: 'Flexible Loan Options',
            color: AppColors.secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w900,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      SizedBox(height: 10),
      Align(
        alignment: Alignment.center,
        child: CustomText(
          text: 'Loan types to cater to different financial needs',
          color: AppColors.lightTextColor,
          fontSize: 13,
          fontWeight: FontWeight.w900,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
