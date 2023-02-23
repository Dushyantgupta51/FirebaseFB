// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../routers/routes.router.dart';
import 'Login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          exit(0);
                        },
                        icon: const Icon(Icons.arrow_back)),
                    PopupMenuButton(itemBuilder: (BuildContext context) {
                      return {'Help', 'Settings'}.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    }),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Icon(
                  Icons.facebook,
                  color: Colors.blue[800],
                  size: 70,
                ),
                const SizedBox(
                  height: 20,
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
                        decoration: const InputDecoration(
                            labelText: 'Mobile number or email'),
                      ),
                      TextFormField(
                  controller: model.passwordController,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                    ],
                  ),
                ),
                
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      model.signIn(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800]),
                    child: const Text(
                      'Log in',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.forgotPass),
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.phoneScreen);
                    },
                    icon: const Icon(Icons.phone),
                    label: const Text(
                      'Login using Phone No.',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      model.googleLogin(context);
                    },
                    icon: const Icon(Icons.email),
                    label: const Text(
                      'Login with Gmail',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800]),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.signUpScreen);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      child: const Text(
                        'Create new account',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
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
