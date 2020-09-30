import 'package:bowfolios/screens/home/custom_drawer.dart';
import 'package:bowfolios/shared/models.dart';
import 'package:flutter/material.dart';

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  final _userProject = Project();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Add Project'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Builder(
          builder: (context) => Form(
            key: _formKey,
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Project name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your project name';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) => setState(() => _userProject.name = val),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please describe your project';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) =>
                      setState(() => _userProject.description = val),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Project URL'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please describe your project homepage URL';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) => setState(() => _userProject.homePage = val),
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Picture URL (optional)'),
                  // SHOULD TEST THIS. SHOULD BE OPTIONAL
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return 'Please enter your title';
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  onSaved: (val) => setState(() => _userProject.picture = val),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      final form = _formKey.currentState;
                      if (form.validate()) {
                        //SEND INFOR TO DATABASE HERE
                      }
                    },
                    child: Text('Submit'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
