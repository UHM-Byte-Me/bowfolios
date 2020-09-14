import 'package:bowfolios/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BowFolios"),
        elevation: 0.0,
        actions: [
          FlatButton(
            child: Text("Log Out"),
            onPressed: () async {
              try {
                await _auth.signOut();
              } catch (e) {}
            },
          )
        ],
      ),
      body: Container(),
    );
  }
}
