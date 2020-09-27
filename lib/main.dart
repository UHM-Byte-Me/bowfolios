import 'package:bowfolios/screens/add_project/add_project.dart';
import 'package:bowfolios/screens/filter/filter.dart';
import 'package:bowfolios/screens/interests/interests.dart';
import 'package:bowfolios/screens/landing.dart';
import 'package:bowfolios/screens/profiles/profiles.dart';
import 'package:bowfolios/screens/projects/projects.dart';
import 'package:bowfolios/screens/your_profile/your_profile.dart';
import 'package:bowfolios/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      //   return SomethingWentWrong();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      //   return Loading();
    }

    return StreamProvider<User>.value(
      value: AuthService().userStream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "BowFolios",
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: LandingWrapper(),
        routes: {
          '/Profiles': (context) => Profiles(),
          '/Projects': (context) => Projects(),
          '/Interests': (context) => Interests(),
          '/AddProject': (context) => AddProject(),
          '/Filter': (context) => Filter(),
          '/YourProfile': (context) => YourProfile(),
        },
      ),
    );
  }
}
