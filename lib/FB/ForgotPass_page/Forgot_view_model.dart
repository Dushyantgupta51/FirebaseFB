// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../routers/routes.router.dart';


class ForgotViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> forgotPass(BuildContext context) async {
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
      await FirebaseAuth.instance
          .sendPasswordResetEmail(
        email: emailController.text.trim(),
      )
          .onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('An error occured !'),
        ));
        Navigator.pushNamed(context, Routes.loginScreen);
      },);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password Reset Email Sent, Please check your Email!'),
        ),
      );
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, Routes.loginScreen);
    }
  }
}
