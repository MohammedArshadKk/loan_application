import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/utils/custom_widgets/custom_container.dart';
import 'package:loan_application/utils/custom_widgets/custom_text.dart';
import 'package:loan_application/views/authentication/screens/loan_calculator_screen.dart';
import 'package:loan_application/views/authentication/widgets/step_indicator.dart';
import 'package:loan_application/views/authentication/widgets/text_field.dart';

class EnterPanNoScreen extends StatelessWidget {
  EnterPanNoScreen({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stepIndicator('Register', true, 1),
                  stepIndicator('Offer', false, 2),
                  stepIndicator('Approval', false, 3),
                ],
              ),
            ),

            Form(
              key: formkey,
              child: Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Material(
                    elevation: 40,
                    child: Container(
                      height: 690,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        border: Border(
                          top: BorderSide(color: AppColors.lightTextColor),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(Icons.arrow_back),
                                  ),
                                  SizedBox(width: 20),
                                  CustomText(
                                    text: 'Verify PAN Number',
                                    color: AppColors.textColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/PAN.png'),
                              ),

                              const SizedBox(height: 30),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Enter Your PAN Number*',
                                    color: AppColors.textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  SizedBox(height: 10),
                                  textField(
                                    'e.g., ABCDE1234F',
                                    'Ee.g., ABCDE1234F',
                                    firstNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter your Your email ID';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 120),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: GestureDetector(
                                      onTap: () {
                                        // formkey.currentState!.validate();
                                        Get.to(
                                          () => LoanCalculatorScreen(),
                                          transition: Transition.downToUp,
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
                                            text: 'Verify',
                                            color: AppColors.secondaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
