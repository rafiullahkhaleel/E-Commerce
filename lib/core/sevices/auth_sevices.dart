import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../view/screens/home_screen.dart';

class AuthServices {
  static Future<void> signInWithGoogle(BuildContext context) async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn();

      FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? user = await _googleSignIn.signIn();
      if (user == null) return;

      final GoogleSignInAuthentication userData = await user.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: userData.accessToken,
        idToken: userData.idToken,
      );
      await _auth.signInWithCredential(credential);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('ERROR OCCURRED $e')));
    }
  }
}
