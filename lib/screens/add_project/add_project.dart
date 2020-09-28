import 'package:bowfolios/screens/home/custom_drawer.dart';
import 'package:flutter/material.dart';

class AddProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Add Project'),
      ),
      body: Text('Add Project body'),
    );
  }
}
