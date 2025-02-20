import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

  Future<void> verifyPhoneNumber(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        log("Auto-sign-in successful!");
      },
      verificationFailed: (FirebaseAuthException error) {
        log("Verification failed: ${error.message}");
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        _verificationId = verificationId;
        log("OTP sent to $phoneNo");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        log("Code auto-retrieval timeout");
      },
      timeout: Duration(seconds: 60),
    );
  }

  Future<void> verifyOTP(String otp) async {
    if (_verificationId == null) {
      throw Exception("Verification ID is null. Please request an OTP first.");
    }

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: otp,
    );

    try {
      await _auth.signInWithCredential(credential);
      log("OTP verification successful!");
    } catch (e) {
      log("Failed to verify OTP: $e");
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    log("User signed out.");
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
