import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/utils/custom_widgets/custom_container.dart';
import 'package:loan_application/utils/custom_widgets/custom_text.dart';
import 'package:loan_application/views/authentication/screens/offer_screen.dart';
import 'package:loan_application/views/authentication/widgets/drop_down.dart';
import 'package:loan_application/views/authentication/widgets/slider.dart';

class LoanCalculatorScreen extends StatefulWidget {
  const LoanCalculatorScreen({super.key});

  @override
  State<LoanCalculatorScreen> createState() => _LoanCalculatorScreenState();
}

class _LoanCalculatorScreenState extends State<LoanCalculatorScreen> {
  final TextEditingController firstNameController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey();
  double principalAmount = 5000;
  final formatter = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹ ',
    decimalDigits: 0,
  );
  double tenureDays = 40;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),

            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset('assets/images/logo.png'),
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
                                    text: 'Apply for loan',
                                    color: AppColors.textColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              CustomText(
                                text:
                                    'We’ve calculated your loan eligibility. Select\n your preferred loan amount and tenure.',
                                color: AppColors.textColor,
                              ),
                              SizedBox(height: 20),

                              const SizedBox(height: 30),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Purpose of Loan*',
                                    color: AppColors.textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  SizedBox(height: 10),
                                  dropdown('Select purpose of loan', [
                                    'Personal Loan',
                                    'Business Loan',
                                    'Vehicle Loan',
                                    'Home Loan',
                                    'Education Loan',
                                    'Agriculture Loan',
                                  ]),
                                  slider(
                                    title: "Principal Amount",
                                    value: principalAmount,
                                    min: 5000,
                                    max: 50000,
                                    unit: "",
                                    formatter:
                                        (value) => formatter.format(value),
                                    onChanged:
                                        (val) => setState(
                                          () => principalAmount = val,
                                        ),
                                  ),
                                  SizedBox(height: 30),
                                  slider(
                                    title: "Tenure",
                                    value: tenureDays,
                                    min: 20,
                                    max: 45,
                                    unit: "Days",
                                    formatter:
                                        (value) => "${value.toInt()} Days",
                                    onChanged:
                                        (val) =>
                                            setState(() => tenureDays = val),
                                  ),
                                  SizedBox(height: 50),

                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: GestureDetector(
                                      onTap: () {
                                        // formkey.currentState!.validate();
                                        Get.to(
                                          () => OfferScreen(
                                            amount: principalAmount.toString(),
                                            days: tenureDays.toString(), 
                                          ),
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
                                            text: 'Apply',
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
                                            text: 'Cancel',
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
