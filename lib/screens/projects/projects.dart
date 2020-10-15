import 'package:bowfolios/screens/home/custom_drawer.dart';
import 'package:bowfolios/screens/profiles/profiles.dart';
import 'package:bowfolios/services/db.dart';
import 'package:bowfolios/shared/models.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    var interestList = document.data()['interests'];
    var projectList = document.data()['projects'];
    var userList = document.data()['users'];
    var pictureList = [];

    //var iterableProjectsList = await mapProjects();
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('${document.data()['name']}'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(document.data()['picture']),
            ),

            // subtitle: Text(
            //   document.data()['description'],
            //   style: TextStyle(color: Colors.black.withOpacity(0.6)),
            // ),
            // *****************************************************************IMAGE
          ),
          // Text(document.data()['description']),
          Row(
            children: [
              Expanded(
                child: Text(document.data()['description']),
              )
            ],
          ),

          Divider(),
          Row(
            children: [
              Wrap(
                spacing: 10.0,
                runSpacing: 20.0,
                // verticalDirection: VerticalDirection.up,
                children: []..addAll(mapInterests(interestList)),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Wrap(spacing: 10.0, runSpacing: 20.0,
                  // verticalDirection: VerticalDirection.up,
                  children: [
                    // for (var user in userList)
                    //   Image.network(document.data()[user]),
                    //       for (var user in userList) Text(user),
                  ] //..addAll(mapUserPics(userList)),
                  ),
            ],
          ),

          // Row(
          //     children: Wrap(
          //   children: [
          //     <Widget>[
          //       // for (var user in userList) Image.network(document.data()[user]),
          //       for (var user in userList) Text(user),
          //     ],
          //   ],
          // )
          // ..addAll(mapUserPics(userList)),
          // ),

          // Row(
          //   // crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     // Text("Projects"),
          //     Wrap(
          //       spacing: 10.0,
          //       runSpacing: 20.0,
          //       children: []..addAll(mapProjects(projectList)),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text('Projects'),
        ),
        body: StreamBuilder(
          // stream: DataService().interestsSteam(),
          stream: FirebaseFirestore.instance.collection('projects').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text("Loading..");
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) =>
                    _buildListItem(context, snapshot.data.documents[index]));
          },
        ));
  }

  List<Chip> mapInterests(List interests) {
    return interests
        .map((interest) => Chip(
              label: Text(interest),
            ))
        .toList();
  }

  List<Chip> mapUserPics(List users) {
    return users
        .map((user) => Chip(
              label: Text('$user'),
            ))
        .toList();
  }

  // List<ListTile> mapUserPics(List users) {
  //   return users
  //       .map((user) => (){

  //       }

  //       .toList();
  // }

  // List<Image> mapUserPics(List users) {
  //   return users.map((user) => Image.network(user.data()['picture'])).toList();
  // }

  // Iterable<Widget> mapUserPics(List users) {
  //   return Row(children: users.map((item) => new Text(item)).toList());
  // }
}
