import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/utils/custom_widgets/custom_container.dart';
import 'package:loan_application/utils/custom_widgets/custom_text.dart';
import 'package:loan_application/views/authentication/screens/email_verification_screen.dart';
import 'package:loan_application/views/authentication/widgets/date_field.dart';
import 'package:loan_application/views/authentication/widgets/drop_down.dart';
import 'package:loan_application/views/authentication/widgets/step_indicator.dart';
import 'package:loan_application/views/authentication/widgets/text_field.dart';

class PersonalDetailsScreen extends StatelessWidget {
  PersonalDetailsScreen({super.key});

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
                                  text: 'Personal Details',
                                  color: AppColors.textColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: 'First Name*',
                                        color: AppColors.textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      SizedBox(height: 10),
                                      textField(
                                        'Your first name',
                                        'Your first name',
                                        firstNameController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Enter your Your first name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20),

                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: 'Last Name*',
                                        color: AppColors.textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      SizedBox(height: 10),

                                      textField(
                                        'Your last name',
                                        'Your last name',
                                        lastNameController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Enter your Your last name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Gender*',
                                  color: AppColors.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                                SizedBox(height: 10),
                                dropdown(
                                  'Select your gender',
                                  ['Male', 'Female', 'Other'],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Select your Gender';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Date of Birth*',
                                  color: AppColors.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                                SizedBox(height: 10),
                                dateField(
                                  context,
                                  'DD - MM - YYYY',
                                  dobController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Select your Date of Birth';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Your Marital Status*',
                                  color: AppColors.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                                SizedBox(height: 10),
                                dropdown(
                                  'Select',
                                  ['Single', 'Married', 'Divorced', 'Widowed'],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Select your Marital Status';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 50),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () {
                                  // formkey.currentState!.validate();
                                  Get.to(
                                    () => EmailVerificationScreen(),
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
                                      text: 'Continue',
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
 


// Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildStepIndicator('Register', true),
//                   _buildStepIndicator('Offer', false),
//                   _buildStepIndicator('Approval', false),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               _buildTextField('First Name*', 'Your first name', firstNameController),
//               const SizedBox(height: 10),
//               _buildTextField('Last Name*', 'Your last name', lastNameController),
//               const SizedBox(height: 10),
//               _buildDropdown('Gender*', ['Male', 'Female', 'Other']),
//               const SizedBox(height: 10),
//               _buildDateField(context, 'Date of Birth*', dobController),
//               const SizedBox(height: 10),
//               _buildDropdown('Your Marital Status*', ['Single', 'Married', 'Divorced', 'Widowed']),
//               const SizedBox(height: 30),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                   ),
//                   onPressed: () {},
//                   child: const Text(
//                     'Continue',
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),