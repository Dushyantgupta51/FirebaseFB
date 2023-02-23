// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../routers/routes.router.dart';
import 'SignUp_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IconButton(
                //   onPressed: () {
                //     Navigator.pushNamedAndRemoveUntil(
                //         context, Routes.loginScreen, (route) => false);
                //   },
                //   icon: const Icon(
                //     Icons.arrow_back,
                //     size: 30,
                //   ),
                // ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "What's your email?",
                  style: TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                  key: model.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: model.emailController,
                        cursorColor: Colors.black,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter correct Mobile number of email";
                          } else {
                            return null;
                          }
                        },
                        decoration:
                            const InputDecoration(labelText: 'Email'),
                      ),
                      TextFormField(
                        controller: model.passwordController,
                        cursorColor: Colors.black,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter correct Password";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                            labelText: 'Password'),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),

                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800]),
                    onPressed: () {
                      model.signIn(context);
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 300,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 93.0),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, Routes.loginScreen),
                    child: Text(
                      'Already have an account',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.blue[800],
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
