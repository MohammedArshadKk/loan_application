import 'package:flutter/material.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/views/authentication/widgets/create_password_content.dart';
import 'package:loan_application/views/authentication/widgets/logo_widget.dart';
import 'package:loan_application/views/authentication/widgets/sign_in_bottom_bar.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [logoWidget(), createPasswordContent()],
        ),
      ),

      bottomNavigationBar: signInBottomBar(),
    );
    ;
  }
}
