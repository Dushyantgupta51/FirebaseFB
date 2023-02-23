// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../routers/routes.router.dart';

final user = FirebaseAuth.instance.currentUser!;

class HomeViewModel extends BaseViewModel {
  final messageController = TextEditingController();
  Future<void> signOut(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 2));
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    await FirebaseAuth.instance.signOut().then(
      (value) {
        Navigator.pushNamed(context, Routes.loginScreen);
      },
    );
  }
  
}
