import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email and password
  Future signInEmail(email, pwd) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future registerWithEmail(email, pwd) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pwd);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
}
