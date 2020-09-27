import 'package:bowfolios/screens/home/custom_drawer.dart';
import 'package:flutter/material.dart';

class Interests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Interests'),
      ),
      body: Text('Interests body'),
    );
  }
}
