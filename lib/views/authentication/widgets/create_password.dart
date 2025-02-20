import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/utils/custom_widgets/custom_container.dart';
import 'package:loan_application/utils/custom_widgets/custom_text.dart';
import 'package:loan_application/views/authentication/screens/personal_details_screen.dart';
import 'package:loan_application/views/authentication/widgets/bottom_app_bar_clipper.dart';
import 'package:loan_application/views/authentication/widgets/create_pass_text_feild_widget.dart';

class CreatePasswordScreen extends StatefulWidget {
  final Function() nextStep;
  final Function() prevStep;

  const CreatePasswordScreen({
    super.key,
    required this.nextStep,
    required this.prevStep,
  });

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _validateAndProceed() {
    if (_formKey.currentState!.validate()) { 
      Get.to(()=>PersonalDetailsScreen(), transition: Transition.rightToLeft);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomAppBarClipper(),
      child: BottomAppBar(
        color: AppColors.secondaryColor,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: widget.prevStep,
                      icon: const Icon(Icons.arrow_back),
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
                const SizedBox(height: 25),

                CreatePassTextFeildWidget(
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text:
                          '* Your password must include at least 8 characters,\n inclusive of at least 1 special character.',
                      textAlign: TextAlign.start,
                      color: AppColors.textColor,
                      fontSize: 12,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: _validateAndProceed,
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
      ),
    );
  }
}
