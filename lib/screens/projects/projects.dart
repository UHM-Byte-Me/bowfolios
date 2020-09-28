import 'package:bowfolios/screens/home/custom_drawer.dart';
import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Projects'),
      ),
      body: Text('Projects body'),
    );
  }
}
