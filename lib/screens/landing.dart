import 'package:bowfolios/screens/authentication/authenticate.dart';
import 'package:bowfolios/screens/home/tempHome.dart';
import 'package:bowfolios/services/db.dart';
import 'package:bowfolios/shared/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user != null) {
      // print(user);

      return MultiProvider(
        providers: [
          StreamProvider<Profile>.value(
            value: DataService().profileStream(user.uid),
          )
        ],
        child: TempHome(),
      );
    } else {
      return Authenticate();
    }
  }
}
