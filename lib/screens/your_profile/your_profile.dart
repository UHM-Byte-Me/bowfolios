import 'package:bowfolios/screens/home/custom_drawer.dart';
import 'package:bowfolios/shared/models.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class YourProfile extends StatefulWidget {
  @override
  _YourProfileState createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
  final _userProfile = Profile();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Your Profile'),
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
                  decoration: InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your first name';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) => setState(() => _userProfile.fName = val),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your last name';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) => setState(() => _userProfile.lName = val),
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'A little about yourself'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your first name';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) => setState(() => _userProfile.bio = val),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your title';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) => setState(() => _userProfile.title = val),
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
                  onSaved: (val) => setState(() => _userProfile.title = val),
                ),
                MultiSelectFormField(
                  autovalidate: false,
                  title: Text('My interests'),
                  validator: (value) {
                    if (value == null || value.length == 0) {
                      return 'Please select one or more options';
                    }
                  },
                  dataSource: [
                    {
                      "display":
                          "Add a map frunction to pull stuff from database here",
                      "value":
                          "Add a map frunction to pull stuff from database here",
                    }
                  ],

                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  // required: true,
                  // hintText: 'Please choose one or more',
                  // val: _myActivities,
                  onSaved: (val) =>
                      setState(() => _userProfile.interests = val),
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
