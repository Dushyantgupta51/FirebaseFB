// ignore_for_file: file_names
import 'package:firebasepractise/Johannes_Milke/Phone_verification_page/phoneVer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhoneViewModel>.reactive(
      viewModelBuilder: () => PhoneViewModel(),
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
                  height: 20,
                ),
                const Text(
                  "What's your Phone Number?",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Enter your Phone Number',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: model.formKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter correct Mobile number";
                      } else {
                        return null;
                      }
                    },
                    controller: model.phoneController,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: '+91 123 456 7890',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 115.0),
                  child: GestureDetector(
                    onTap: () {
                      model.phoneVer(context);
                    },
                    child: Text(
                      'Send Code',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.blue[800],
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
