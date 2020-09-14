import 'package:bowfolios/screens/home/tempHome.dart';
import 'package:bowfolios/services/auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp({this.toggle});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final _pass = TextEditingController();
  final _confirmPass = TextEditingController();

  String _email = "";
  String _password = "";
  String _error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        elevation: 0.0,
        title: Text("Sign Up"),
      ),
      backgroundColor: Colors.blue[100],
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Wrap(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    _error,
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Email",
                    ),
                    validator: (value) {
                      return value.isEmpty ? "Enter an email" : null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Password",
                    ),
                    controller: _pass,
                    obscureText: true,
                    validator: (value) {
                      return value.length < 7
                          ? "Enter at least 8 character"
                          : null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Confirm Password",
                    ),
                    controller: _confirmPass,
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Confirm your password";
                      } else if (value != _pass.text) {
                        return "Password do not match!";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        try {
                          await _auth.signUpWithEmail(_email, _password);
                        } catch (e) {
                          setState(() {
                            _error = e.toString();
                          });
                        }
                      }
                    },
                    child: Text("Sign Up"),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text("or if you already have an account"),
                  SizedBox(
                    height: 5.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      widget.toggle();
                    },
                    child: Text("Log In"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
