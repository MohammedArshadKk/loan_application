import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/utils/custom_widgets/custom_container.dart';
import 'package:loan_application/utils/custom_widgets/custom_text.dart';
import 'package:loan_application/views/authentication/screens/application_status_screen.dart';
import 'package:loan_application/views/authentication/screens/enter_pan_no_screen.dart';
import 'package:loan_application/views/authentication/widgets/step_indicator.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key, required this.amount, required this.days});

  final String amount;
  final String days;

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  double finalAmount = 0;
  @override
  void initState() {
    log(widget.days);
    finalAmount = calculateFinalAmount();

    super.initState();
  }

  double calculateFinalAmount() {
    double principal = double.tryParse(widget.amount) ?? 0;
    double days = double.tryParse(widget.days) ?? 0;
    double interest = principal * 0.01 * days;

    log("Principal: $principal");
    log("Days: $days");
    log("Interest: $interest");
    log("Final Amount: ${principal + interest}");

    return principal + interest;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stepIndicator('Register', false, 1),
                  stepIndicator('Offer', true, 2),
                  stepIndicator('Approval', false, 3),
                ],
              ),
            ),
            SizedBox(height: 90),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20),
                      CustomText(
                        text: 'Our Offerings',
                        color: AppColors.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset('assets/images/coin.png'),
                      ),
                      CustomText(
                        text:
                            'Congratulations! We can offer you Rs. ${widget.amount} Amount Within 30 minutes for ${widget.days} days, with a payable amount of Rs. ${finalAmount}. Just with few more steps.',
                        color: AppColors.textColor,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 30),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () {
                            // formkey.currentState!.validate();
                            Get.to(
                              () => ApplicationStatusScreen(),
                              transition: Transition.rightToLeft,
                              duration: Duration(milliseconds: 500),
                            );
                          },
                          child: CustomContainer(
                            height: 50,
                            width: double.infinity,
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.circular(6),
                            child: Center(
                              child: CustomText(
                                text: 'Accept Offer',
                                color: AppColors.secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () {
                            // formkey.currentState!.validate();
                            // Get.to(
                            //   () => LoanCalculatorScreen(),
                            //   transition: Transition.rightToLeft,
                            // );
                          },
                          child: CustomContainer(
                            height: 50,
                            width: double.infinity,
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(6),
                            borderColor: Border.all(
                              color: AppColors.buttonColor,
                            ),
                            child: Center(
                              child: CustomText(
                                text: 'Extend Offer',
                                color: AppColors.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
