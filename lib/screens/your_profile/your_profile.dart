import 'package:bowfolios/screens/home/custom_drawer.dart';
import 'package:flutter/material.dart';

class YourProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Your Profile'),
      ),
      body: Text('Your Profile body'),
    );
  }
}
