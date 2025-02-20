// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/utils/custom_widgets/custom_container.dart';
import 'package:loan_application/utils/custom_widgets/custom_text.dart';
import 'package:loan_application/views/authentication/widgets/step_indicator.dart';

class ApplicationStatusScreen extends StatefulWidget {
  const ApplicationStatusScreen({super.key});

  @override
  State<ApplicationStatusScreen> createState() =>
      _ApplicationStatusScreenState();
}

class _ApplicationStatusScreenState extends State<ApplicationStatusScreen> {
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
                  stepIndicator('Register', false, 1),
                  stepIndicator('Offer', false, 2),
                  stepIndicator('Approval', true, 3),
                ],
              ),
            ),

            Expanded(
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
                      padding: const EdgeInsets.all(20.0),
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
                                text: 'Application Status',
                                color: AppColors.textColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          StatusButton(
                            'Application Submitted',
                            true,
                            isCompleted: true,
                          ),
                          StatusButton(
                            'Application under Review',
                            true,
                            isSelected: true,
                          ),
                          StatusButton('E-KYC', false),
                          StatusButton('E-Nach', false),
                          StatusButton('E-Sign', false),
                          StatusButton('Disbursement', false),
                          Spacer(),
                          Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.fact_check_outlined,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Application Under Review',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'We’re carefully reviewing your application to ensure everything is in order. Thank you for your patience.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () {
                                // formkey.currentState!.validate();
                                // Get.to(
                                //   () => LoanCalculatorScreen(),
                                //   transition: Transition.downToUp,
                                //   duration: Duration(milliseconds: 500),
                                // );
                              },
                              child: CustomContainer(
                                height: 50,
                                width: double.infinity,
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(6),
                                child: Center(
                                  child: CustomText(
                                    text: 'Details',
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
          ],
        ),
      ),
    );
  }
}

class StatusButton extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final bool isSelected;
  final bool isCompleted;

  const StatusButton(
    this.text,
    this.isEnabled, {
    super.key,
    this.isSelected = false,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor =
        isCompleted ? Colors.green : (isSelected ? Colors.blue : Colors.grey);
    Color textColor =
        isCompleted ? Colors.green : (isSelected ? Colors.blue : Colors.grey);
    Color iconColor = textColor;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
        ),
        child: TextButton(
          onPressed: isEnabled ? () {} : null,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.event, color: iconColor),
              ),
              Text(
                text,
                style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Loan application no. #CS12323',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             StatusButton('Application Submitted', true),
//             StatusButton('Application under Review', true, isSelected: true),
//             StatusButton('E-KYC', false),
//             StatusButton('E-Nach', false),
//             StatusButton('E-Sign', false),
//             StatusButton('Disbursement', false),
//             Spacer(),
//             Center(
//               child: Column(
//                 children: [
//                   Icon(Icons.fact_check_outlined, size: 50, color: Colors.blue),
//                   SizedBox(height: 8),
//                   Text(
//                     'Application Under Review',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'We’re carefully reviewing your application to ensure everything is in order. Thank you for your patience.',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50),
//                 backgroundColor: Colors.blue,
//               ),
//               onPressed: () {},
//               child: Text('Continue', style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//       ),
//     );