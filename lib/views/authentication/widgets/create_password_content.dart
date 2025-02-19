import 'package:flutter/widgets.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/utils/custom_widgets/custom_text.dart';

Widget createPasswordContent() {
  return Column(
    children: [
      Align(
        alignment: Alignment.center,
        child: Image.asset('assets/images/Frame 3.png'),
      ),
      Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: CustomText(
            text: '24x7 Customer Care',
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
          text: 'Dedicated customer support team',
          color: AppColors.lightTextColor,
          fontSize: 13,
          fontWeight: FontWeight.w900,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
