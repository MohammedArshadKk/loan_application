import 'package:flutter/material.dart';
import 'package:loan_application/views/authentication/widgets/create_account_with_phone.dart';
import 'package:loan_application/views/authentication/widgets/create_password.dart';
import 'package:loan_application/views/authentication/widgets/enter_otp_bar.dart';

Widget bottomAppBarWidget(int index, Function() nextStep, Function() prevStep) {
  List<Widget> forms = [
    createAccountWithPhone(index, nextStep),
    CreatePasswordScreen(nextStep: nextStep, prevStep: prevStep),
  ];
  return forms[index];
}
