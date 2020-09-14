import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get userStream {
    return _auth
        .authStateChanges()
        .map((event) => FirebaseAuth.instance.currentUser);
  }

  // Sign in with email and password
  Future logInWithEmail(email, pwd) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      return result.user;
    } catch (e) {
      // print(e.toString());
      return Future.error(e.toString());
    }
  }

  // Register with email and password
  Future signUpWithEmail(email, pwd) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pwd);
      return result.user;
    } catch (e) {
      // print(e.toString());
      return Future.error(e.toString());
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      // print(e.toString());
      return Future.error(e.toString());
    }
  }
}
