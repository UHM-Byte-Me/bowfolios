import 'package:bowfolios/screens/authentication/authenticate.dart';
import 'package:bowfolios/screens/home/tempHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user != null) {
      return TempHome();
    } else {
      return Authenticate();
    }
  }
}
