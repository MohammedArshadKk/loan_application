import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/utils/custom_widgets/custom_container.dart';
import 'package:loan_application/utils/custom_widgets/custom_text.dart';
import 'package:loan_application/views/authentication/screens/enter_pan_no_screen.dart';
import 'package:loan_application/views/authentication/widgets/step_indicator.dart';
import 'package:loan_application/views/authentication/widgets/text_field.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController dobController = TextEditingController();

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
                                    text: 'Personal Email ID',
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
                                child: Image.asset('assets/images/email.png'),
                              ),
                          
                              const SizedBox(height: 30),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Email ID*',
                                    color: AppColors.textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  SizedBox(height: 10),
                                  textField(
                                    'Enter your email ID',
                                    'Enter your email ID',
                                    firstNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter your Your email ID';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                  CustomText(
                                    text: 'Enter OTP*',
                                    color: AppColors.textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 70,
                                    child: OtpTextField(
                                      numberOfFields: 6,
                                      showFieldAsBox: true,
                                      keyboardType: TextInputType.number,
                                      fieldHeight: 60,
                                      fieldWidth: 50,
                                      onSubmit: (String value) {
                                        // otp = value;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 50),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: GestureDetector(
                                      onTap: () {
                                        // formkey.currentState!.validate();
                                        Get.to(
                                          () => EnterPanNoScreen(), 
                                          transition: Transition.rightToLeft,
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
