import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'widgets/complete_information_body.dart';

class CompleteInformationView extends StatelessWidget {
  const CompleteInformationView({super.key, required this.userCredential});
  final UserCredential? userCredential;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompleteInformationBody(
        userCredential: userCredential!,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // leading: IconButton(
        //   onPressed: () async {
        //     GoogleSignIn().disconnect();
        //     await FirebaseAuth.instance.signOut();
        //     Navigator.of(context).pop();
        //   },
        //   icon: Icon(Icons.arrow_back),
        //   color: Colors.red,
        // ),
      ),
    );
  }
}
