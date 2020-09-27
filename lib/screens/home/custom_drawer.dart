import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
                'We can insert user\'s name and their email here. Maybe a UH logo too'),
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent,
            ),
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
