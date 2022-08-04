import 'package:firebase_auth/firebase_auth.dart';
import 'package:trips_app2/User/repository/fireBaseAuth.dart';

class AuthRepository {

  final _firebaseAuthAPI = FirebaseAuthAPI();
  Future<User?> signInFirebase() => _firebaseAuthAPI.signIn();

  signOut() => _firebaseAuthAPI.signOut();

  
}