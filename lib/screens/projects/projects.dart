// import 'dart:html';
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
    var userList = document.data()['userList'];

    var pictureList = [];
    //   var query = document.data()["users"].orderByKey();
    //       query.once("value").then((snapshot) {
    //     snapshot.forEach((childSnapshot) {
    //     // key will be "ada" the first time and "alan" the second time
    //     var key = childSnapshot.key;
    //     // childData will be the actual contents of the child
    //     var childData = childSnapshot.val();
    // });

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
              Padding(padding: const EdgeInsets.all(10.0)),
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
                children: [
                  Padding(padding: const EdgeInsets.all(5.0)),
                ]..addAll(mapInterests(interestList)),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Wrap(
                spacing: 10.0,
                runSpacing: 20.0,

                // verticalDirection: VerticalDirection.up,
                children: [
                  Padding(padding: const EdgeInsets.all(5.0)),
                  //Text($'key'),

                  // for (var user in userList)
                  //   Image.network(document.data()[user]),
                  //       for (var user in userList) Text(user),
                ]..addAll(mapUserPics(userList)),
              ),
            ],
          ),
          Divider(),

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

  List<CircleAvatar> mapUserPics(List users) {
    // stream: FirebaseFirestore.instance.collection('profiles').snapshots();
    // Query userData =
    //     FirebaseFirestore.instance.collection('profiles'); //get a qcollections
    //user is the user id
    //need where to get profiles.where userid = user, -test for first name from now
    // var profileImage = '';
    return users
        .map((user) => CircleAvatar(
              backgroundImage: NetworkImage(user),
            ))
        .toList();

    // for (var user in users)
    //   Widget build(BuildContext context) {
    //     return Scaffold(
    //         drawer: CustomDrawer(),
    //         appBar: AppBar(
    //           title: Text('Projects'),
    //         ),
    //         body: StreamBuilder(
    //           // stream: DataService().interestsSteam(),
    //           stream:
    //               FirebaseFirestore.instance.collection('profiles').snapshots(),
    //           builder: (context, snapshot) {
    //             if (!snapshot.hasData) return const Text("Loading..");
    //             // profileImage = snapshot.data.
    //             return Row(
    //               children: [
    //                 CircleAvatar(
    //                   backgroundImage: NetworkImage(snapshot.data['picture']),
    //                 )
    //               ],
    //             );
    //             // itemCount: snapshot.data.documents.length,
    //             // itemBuilder: (context, index) =>
    //             //     _buildListItem(context, snapshot.data.documents[index]));
    //           },
    //         ));
    //   }

    // }

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
}
