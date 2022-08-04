import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signIn() async { 
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication? gSA = await googleSignInAccount?.authentication;

    UserCredential userCredential = await _auth.signInWithCredential(
      GoogleAuthProvider.credential( idToken: gSA?.idToken, accessToken: gSA?.accessToken)
    );
    
    return userCredential.user;
    
  }

  void signOut() async {
    await _auth.signOut().then((value) => print("Sesión cerrada"));
    googleSignIn.signOut();
    print("Sesiones cerradas");
  }

}

