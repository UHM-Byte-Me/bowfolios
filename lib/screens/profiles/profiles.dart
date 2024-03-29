import 'package:bowfolios/screens/home/custom_drawer.dart';
import 'package:bowfolios/services/db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profiles extends StatelessWidget {
  @override
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    var interestList = document.data()['interests'];
    var projectList = document.data()['projects'];
    return Card(
      child: Column(
        children: [
          ListTile(
            title:
                Text('${document.data()['fName']} ${document.data()['lName']}'),
            subtitle: Text(
              document.data()['title'],
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
            // trailing: Icon('${Image.network(document.data()['picture'])}'),
            // trailing: ImageIcon(NetworkImage(document.data()['picture']))
            leading: CircleAvatar(
              //radius: 50,
              backgroundImage: NetworkImage(document.data()['picture']),
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                'Projects',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),

                //style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
              ),
            ),
          ),
          // Row(
          //   children: [
          //     child: Container(
          //     padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          //     child: Text(
          //       'Projects',
          //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          //     ),),

          //   ],

          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("Projects"),
              Wrap(
                spacing: 10.0,
                runSpacing: 20.0,
                children: [
                  Padding(padding: const EdgeInsets.all(5.0)),
                ]..addAll(mapProjects(projectList)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text('Profiles'),
        ),
        body: StreamBuilder(
          // stream: DataService().interestsSteam(),
          stream: FirebaseFirestore.instance.collection('profiles').snapshots(),
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

  List<Chip> mapProjects(List projects) {
    return projects
        .map((project) => Chip(
              label: Text(project),
            ))
        .toList();
  }
}
