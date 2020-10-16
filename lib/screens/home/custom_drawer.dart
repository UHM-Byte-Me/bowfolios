import 'package:bowfolios/shared/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final profile = Provider.of<Profile>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(''),
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent,
            ),
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     margin: EdgeInsets.only(
            //       top: 30,
            //       bottom: 10,
            //     ),
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       image: DecorationImage(
            //           image: NetworkImage(
            //               "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"),
            //           fit: BoxFit.fill),
            //     ),
            //   ),
          ),
          ListTile(
            title: Text('Your Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/YourProfile');
              // USE THE FOLLOWING IF YOU WANT TO CLEAR THE STACK
              // EVERY TIME WE SWITCH PAGES
              // Navigator.pushNamedAndRemoveUntil(
              //     context, "/YourProfile", (r) => false);

              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Profiles'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/Profiles');

              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Projects'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/Projects');

              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Interests'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/Interests');
              // Update the state of the app.
              // ...
            },
          ),
          Divider(),
          ListTile(
            title: Text('Add Project'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/AddProject');
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Filter'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/Filter');
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
