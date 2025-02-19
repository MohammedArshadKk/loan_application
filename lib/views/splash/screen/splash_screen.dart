
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:loan_application/utils/colors.dart';
import 'package:loan_application/views/authentication/screens/credentials_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Get.off(() => CredentialsScreen(), transition: Transition.downToUp);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: Image.asset('assets/images/splash.png')),
    );
  }
}
