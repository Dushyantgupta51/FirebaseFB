// ignore_for_file: file_names, avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../routers/routes.router.dart';

final user = FirebaseAuth.instance.currentUser!;

class SignUpViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> signIn(BuildContext context) async {
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
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((value) async {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          'email': FirebaseAuth.instance.currentUser!.email
        }).then(
          (value) {
            print(FirebaseAuth.instance.currentUser);
          },
        );
        Navigator.pushNamed(context, Routes.select);
      }).onError(
        (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Account already exist'),
          ));
          Navigator.pushNamed(context, Routes.loginScreen);
        },
      );
    }
  }
}
