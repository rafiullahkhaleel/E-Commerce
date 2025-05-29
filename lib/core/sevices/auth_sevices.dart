import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static Future<void> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();

    FirebaseAuth _auth = FirebaseAuth.instance;

    final GoogleSignInAccount? user = await _googleSignIn.signIn();
    if(user == null) return;

    final GoogleSignInAuthentication userData = await user.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: userData.accessToken,
      idToken: userData.idToken
    );
    await _auth.signInWithCredential(credential);
  }
}
