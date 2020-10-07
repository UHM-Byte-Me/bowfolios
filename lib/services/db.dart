import 'package:bowfolios/shared/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class DataService {
  FirebaseFirestore _base;
  CollectionReference _profiles;
  CollectionReference _interests;
  CollectionReference _projects;

  DataService() {
    this._base = FirebaseFirestore.instance;
    this._profiles = _base.collection('profiles');
    this._interests = _base.collection('interests');
    this._projects = _base.collection('projects');
  }

  Future getProfile(String id) async {
    var snap = await _profiles.doc(id).get();

    return Profile.fromFireStore(snap);
  }

  void updateProfile(Profile input) {
    _profiles.doc(input.id).set(
      {
        'fName': input.fName,
        'lName': input.lName,
        'bio': input.bio,
        'title': input.title,
        'picture': input.picture,
        'interets': input.interests,
        'projects': input.projects,
      },
    );

    input.interests.forEach((element) {
      // find id of interest
      _interests.where("name" == element).get().then((value) => {
            // add picture to interest
            if (value.size > 0)
              {
                _interests.doc(value.docs[0].id).set({
                  input.id: {'picture': input.picture}
                })
              }
          });
    });

    input.projects.forEach((element) {
      // find id of interest
      _projects.where("name" == element).get().then((value) => {
            // add picture to interest
            if (value.size > 0)
              {
                _projects.doc(value.docs[0].id).set({
                  input.id: {'picture': input.picture}
                })
              }
          });
    });
  }

  Stream<Profile> profileStream(String id) {
    return _profiles
        .doc(id)
        .snapshots()
        .map((snap) => snap.data() != null ? Profile.fromFireStore(snap) : {});
  }

  Stream<List<Interest>> interestsSteam() {
    return _interests.snapshots().map(getInterestsList);
  }

  List<Interest> getInterestsList(QuerySnapshot snap) {
    if (snap.docs.length > 0) {
      return snap.docs.map((data) {
        return Interest.fromFireStore(data);
      });
    }

    return [];
  }

  Future<Project> getProject(String name) async {
    return _projects
        .where("name" == name)
        .get()
        .then((value) => Project.fromFireStore(value.docs[0]));
  }

  void updateProject(Project input) {
    _profiles.doc(input.id).set(
      {
        "name": input.name,
        "homepage": input.homePage,
        "description": input.description,
        "picture": input.picture,
        "interests": input.interests,
      },
    );

    input.interests.forEach((element) {
      // find id of interest
      _interests.where("name" == element).get().then((value) => {
            // add picture to interest
            if (value.size > 0)
              {
                _interests.doc(value.docs[0].id).set({
                  input.id: {'picture': input.picture}
                })
              }
          });
    });
  }
}
