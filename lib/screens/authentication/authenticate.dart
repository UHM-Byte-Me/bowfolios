import 'package:bowfolios/screens/authentication/log_in.dart';
import 'package:bowfolios/screens/authentication/sign_up.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool _showSignUp = false;

  void toggleForm() {
    setState(() {
      _showSignUp = !_showSignUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showSignUp) {
      return Container(
        child: SignUp(toggle: toggleForm),
      );
    } else {
      return Container(
        child: LogIn(toggle: toggleForm),
      );
    }
  }
}
