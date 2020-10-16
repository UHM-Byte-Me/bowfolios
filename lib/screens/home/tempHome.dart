import 'package:bowfolios/screens/home/custom_drawer.dart';
import 'package:bowfolios/screens/home/image_placement.dart';
import 'package:bowfolios/screens/home/text_section.dart';
import 'package:bowfolios/services/auth.dart';
import 'package:bowfolios/shared/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TempHome extends StatelessWidget {
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);

    if (profile != null) {
      print(profile.id);
      print(profile.fName);
      print(profile.lName);
    }

    return Scaffold(
      //insert a modular bar here
      appBar: AppBar(
        title: Text('Home Page'),
        elevation: 0.0,
        actions: [
          FlatButton(
            child: Text("Log Out"),
            onPressed: () async {
              try {
                await AuthService().signOut();
              } catch (e) {}
            },
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "Start by making your profile...",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                //style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
              ),
            ),
            Divider(
              height: 20.0,
            ),
            ImagePlacement("assets/newImages/addprofile.png"),
            Divider(
              height: 100.0,
              thickness: 10.0,
              color: Colors.green,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "The Profiles page shows all the current defined profiles and their associated Projects and Interests:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                //style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
              ),
            ),
            Divider(
              height: 20.0,
            ),
            ImagePlacement("assets/newImages/profile3.png"),
            Divider(
              height: 100.0,
              thickness: 10.0,
              color: Colors.green,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "The Projects page shows all of the currently defined Projects and their associated Profiles and Interests",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                //style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
              ),
            ),
            Divider(
              height: 20.0,
            ),
            ImagePlacement("assets/newImages/project.png"),
            Divider(
              height: 100.0,
              thickness: 10.0,
              color: Colors.green,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "Create your own project!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                //style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
              ),
            ),
            Divider(
              height: 20.0,
            ),
            ImagePlacement("assets/newImages/addproject.png"),
            Divider(
              height: 100.0,
              thickness: 10.0,
              color: Colors.green,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "Finally, the Interests page shows all the currently defined Interests, and their associated Profiles and Projects",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                //style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
              ),
            ),
            Divider(
              height: 20.0,
            ),
            ImagePlacement("assets/newImages/interests.png"),
          ],
        ),
      ),
    );
  }
}
