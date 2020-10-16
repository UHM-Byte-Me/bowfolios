import 'package:bowfolios/screens/home/custom_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Interests extends StatelessWidget {
  // var dbLink = FirebaseFirestore.instance.collection('profiles').snapshots();

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    // var interestList = document.data()['interests'];
    var userPics = document.data()['userPics'];
    return Card(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: [
            Padding(padding: const EdgeInsets.all(5.0)),
          ]),
          //Title('test'),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                '${document.data()['name']}',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),

                //style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
              ),
            ),
          ),
          Divider(),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("Projects"),
              Wrap(
                spacing: 10.0,
                runSpacing: 20.0,
                children: [
                  Padding(padding: const EdgeInsets.all(5.0)),
                ]..addAll(mapUserPics(userPics)),
              ),
            ],
          ),
          Row(children: [
            Padding(padding: const EdgeInsets.all(10.0)),
          ]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text('Interests'),
        ),
        body: StreamBuilder(
          // stream: DataService().interestsSteam(),
          stream:
              FirebaseFirestore.instance.collection('interests').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text("Loading..");
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) =>
                    _buildListItem(context, snapshot.data.documents[index]));
          },
        ));
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
  }
}
