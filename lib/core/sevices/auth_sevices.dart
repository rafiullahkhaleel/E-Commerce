import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../view/screens/home_screen.dart';

class AuthServices {
  static Future<void> signInWithGoogle(BuildContext context) async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn();

      FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? userAccount = await _googleSignIn.signIn();
      if (userAccount == null) return;

      final GoogleSignInAuthentication userData =
          await userAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: userData.accessToken,
        idToken: userData.idToken,
      );
      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      User? user = userCredential.user;

      if (user != null) {
        String name = user.displayName ?? '';
        String email = user.email ?? '';
        String uid = user.uid ?? '';
        String image = user.photoURL ?? '';

        await Provider.of<UserDataProvider>(
          context,
          listen: false,
        ).saveUserData(name, email, image, uid);
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('ERROR OCCURRED $e')));
    }
  }
}

class UserDataProvider extends ChangeNotifier {
  Future<void> saveUserData(
    String name,
    String email,
    String image,
    String uid,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({'name': name, 'email': email, 'uid': uid, 'image': image});
    } catch (e) {
      print(e);
    }
  }
}
