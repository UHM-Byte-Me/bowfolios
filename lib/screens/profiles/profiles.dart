import 'package:bowfolios/screens/home/custom_drawer.dart';
import 'package:flutter/material.dart';

class Profiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Profiles'),
      ),
      body: Text('Profiles Body'),
    );
  }
}
