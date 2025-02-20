import 'package:flutter/material.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/views/authentication/widgets/bottom_app_bar_widget.dart';
import 'package:loan_application/views/authentication/widgets/create_password_content.dart';
import 'package:loan_application/views/authentication/widgets/logo_widget.dart';
import 'package:loan_application/views/authentication/widgets/otp_content_widget.dart';
import 'package:loan_application/views/authentication/widgets/phone_number_register_content_widget.dart';

class CredentialsScreen extends StatefulWidget {
  const CredentialsScreen({super.key});

  @override
  State<CredentialsScreen> createState() => _CredentialsScreenState();
}

class _CredentialsScreenState extends State<CredentialsScreen> {
  List<Widget> contents = [
    phoneNumberRegisterContentWidget(),
    createPasswordContent(),
  ];
  int index = 0;
  void nextStep() {
    if (index < contents.length - 1) {
      setState(() {
        index++;
      });
    }
  }

  void prevStep() {
    if (index > 0) {
      setState(() {
        index--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [logoWidget(), contents[index]],
        ),
      ),

      bottomNavigationBar: bottomAppBarWidget(index, nextStep, prevStep),
    );
  }
}
