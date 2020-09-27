import 'package:bowfolios/models/location.dart';
import 'package:flutter/material.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: ListView(
        children: locations.map((location) => Text(location.name)).toList(),
      ),
    );
  }
}
