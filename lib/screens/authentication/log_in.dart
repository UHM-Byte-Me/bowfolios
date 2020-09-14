import 'package:bowfolios/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:bowfolios/screens/home/tempHome.dart';

class LogIn extends StatefulWidget {
  final Function toggle;
  LogIn({this.toggle});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _auth = AuthService();

  String _email = "";
  String _password = "";
  String _error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        elevation: 0.0,
        title: Text("Log In"),
      ),
      backgroundColor: Colors.blue[100],
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Wrap(
          children: [
            Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    _error,
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Email",
                    ),
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
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Password",
                    ),
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
                      try {
                        await _auth.logInWithEmail(_email, _password);
                      } catch (e) {
                        setState(() {
                          _error = e.toString();
                        });
                      }
                    },
                    child: Text("Log In"),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text("or if you're new"),
                  SizedBox(
                    height: 5.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      widget.toggle();
                    },
                    child: Text("Sign Up"),
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TempHome()),
                );
              },
              child: Text("Home Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
