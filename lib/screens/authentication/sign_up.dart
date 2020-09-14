import 'package:bowfolios/screens/home/tempHome.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        elevation: 0.0,
        title: Text("Sign Up"),
      ),
      backgroundColor: Colors.blue[100],
      body: Column(
          //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          children: [
            RaisedButton(
              onPressed: () async {},
              child: Text("Log In"),
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
          ]),
    );
  }
}
