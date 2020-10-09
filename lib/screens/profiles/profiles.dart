import 'package:bowfolios/screens/home/custom_drawer.dart';
import 'package:bowfolios/services/db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profiles extends StatelessWidget {
  @override
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text('Profiles'),
        ),
        body: StreamBuilder(
          stream: DataService().interestsSteam(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text("Loading..");
            return ListView.builder(
                itemBuilder: (context, index) =>
                    _buildListItem(context, snapshot.data.documents[index]));
          },
        ));
  }
}
