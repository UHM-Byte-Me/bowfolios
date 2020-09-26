import 'package:flutter/material.dart';

class TopDrawer extends StatelessWidget {
  final String title;

  TopDrawer(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
