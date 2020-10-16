import 'dart:developer';

import 'package:bowfolios/screens/home/custom_drawer.dart';
import 'package:bowfolios/services/db.dart';
import 'package:bowfolios/shared/models.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var currentFilter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Filter'),
      ),
      body: Wrap(
        children: [
          buildPage(),
        ],
      ),
    );
  }

  Column buildPage() {
    return Column(
      children: [
        Center(child: buildFilterList()),
        new Divider(),
        new Text(
            "Unfinished: Ecnountered Memory Issue with Factory function of custom classes"),
        // buildProjectSearchResult(),
        new Divider(),
        // new Text("Profiles"),
        // buildProfileSearchResult(),
      ],
    );
  }

  Center buildProjectSearchResult() {
    return Center(
      child: FutureBuilder(
        future: DataService().searchProject(currentFilter),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print("DEAD");
            return new Container(
              child: Center(
                child: Text("No Results..."),
              ),
            );
          }

          return new Text(snapshot.data[0].name);

          return Container(
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(snapshot.data[index].name),
                        subtitle: Text(
                          snapshot.data[index].description,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Center buildProfileSearchResult() {
    return Center(
      child: FutureBuilder(
        future: DataService().searchProfile(currentFilter),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Container(
              child: Center(
                child: Text("No Results..."),
              ),
            );
          }

          return new Text(snapshot.data[0].toString());

          return Container(
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(snapshot.data[index].name),
                        subtitle: Text(
                          snapshot.data[index].description,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Center buildFilterList() {
    return Center(
      child: new FutureBuilder(
          future: DataService().interestsSteam(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Interest>> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return new Container(
                  width: 280,
                  child: new DropdownButton<String>(
                      items: snapshot.data
                          .map((interest) => DropdownMenuItem<String>(
                                child: Text(interest.name),
                                value: interest.name,
                              ))
                          .toList(),
                      onChanged: (String value) {
                        setState(() {
                          currentFilter = value;
                        });
                      },
                      isExpanded: true,
                      value: currentFilter,
                      hint: Text('Select one...')));
            }
          }),
    );
  }
}
