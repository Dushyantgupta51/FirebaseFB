// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasepractise/FB/Phone_verification_page/phoneVer_view.dart';
import 'package:firebasepractise/routers/routes.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'enterCode_view.dart';

class PhoneViewModel extends BaseViewModel {
  var code = "";
  final formKey = GlobalKey<FormState>();
  bool loading = true;
  final phoneController = TextEditingController();
  final codeController = TextEditingController();
  var verificationId = '';
  Future<void> phoneVer(context) async {
    if ((formKey.currentState!.validate())) {
      showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 2));
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (_) {
          loading = false;
        },
        codeSent: (String verification, int? token) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const EnterCode()));
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        verificationFailed: (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Code didnt Sent'),
            ),
          );
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const PhoneScreen()));
        },
      );
    }
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  void verifyOTP(context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: code);
    await auth.signInWithCredential(credential);
    Navigator.pushNamed(context, Routes.homePage);
    // NavigationService().navigateTo(Routes.homePage);
  }
}
