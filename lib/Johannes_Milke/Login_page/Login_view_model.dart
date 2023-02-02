// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';

import '../../app/routers/routes.router.dart';

class LoginViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  String userEmail = "";
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
          .signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then(
        (value) {
          Navigator.pushNamed(context, Routes.select);
        },
      ).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Wrong Credentials'),

        ));
         Navigator.pushNamed(context, Routes.loginScreen);
      });
    }
  }

  googleLogin(context) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var result = await googleSignIn.signIn();
      if (result == null) {
        return;
      }
      final userData = await result.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushNamed(context, Routes.homePage);
    }
    // ignore: empty_catches
    catch (error) {}
  }

  // Future<UserCredential> signInWithFacebook(context) async {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     },
  //   );
  //   final LoginResult loginResult = await FacebookAuth.instance
  //       .login(permissions: ['email', 'public_profile', 'user_birthday']);
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //   final userData = await FacebookAuth.instance.getUserData();
  //   userEmail = userData['email'];
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
}
