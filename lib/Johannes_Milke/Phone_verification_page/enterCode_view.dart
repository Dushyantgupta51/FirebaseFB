// ignore_for_file: file_names
import 'package:firebasepractise/Johannes_Milke/Phone_verification_page/phoneVer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EnterCode extends StatelessWidget {
  const EnterCode({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhoneViewModel>.reactive(
      viewModelBuilder: () => PhoneViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Enter Security Code',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Pleae check for a text message with your code. Your code is 6 characters in length.',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                
                controller: viewModel.codeController,
                onChanged: (value) async{
                 viewModel.code = value;
                },
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                decoration:
                    const InputDecoration(labelText: 'Verification Code'),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800]),
                  onPressed: () {
                    viewModel.verifyOTP(context);
                  },
                  child: const Text(
                    'Verify',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
