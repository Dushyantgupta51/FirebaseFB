// ignore_for_file: file_names

import 'package:firebasepractise/Johannes_Milke/ForgotPass_page/Forgot_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../app/routers/routes.router.dart';

class ForgotPass extends StatelessWidget {
  const ForgotPass({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotViewModel>.reactive(
      viewModelBuilder: () => ForgotViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IconButton(
              //   onPressed: () {
              //     Navigator.pushNamedAndRemoveUntil(
              //         context, Routes.loginScreen, (route) => false
              //         );
              //   },
              //   icon: const Icon(
              //     Icons.arrow_back,
              //     size: 30,
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Find your account',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Enter your gmail',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: model.formKey,
                child: TextFormField(
                  controller: model.emailController,
                  cursorColor: Colors.white,
                  validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter correct Email";
                          } else {
                            return null;
                          }
                        },
                  decoration:
                      const InputDecoration(labelText: 'Enter your Email'),
                ),
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
                    model.forgotPass(context);
                  },
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: GestureDetector(
                  onTap: () {
                     Navigator.pushNamed(context, Routes.phoneScreen);
                  },
                  child: const Text(
                    'Search by Phone number instead',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
