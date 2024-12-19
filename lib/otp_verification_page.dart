import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:pinput/pinput.dart';
import 'signup_page.dart';


class OTPVerificationPage extends StatelessWidget {
  const OTPVerificationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Code')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Enter Verification Code',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('We have sent a code to your email'),
            const SizedBox(height: 20),
            Pinput(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Verify code logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Center(child: Text('Verify Now',style: TextStyle(color: Colors.white),)),
            ),
          ],
        ),
      ),
    );
  }
}
