import 'package:bowfolios/shared/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class DataService {
  CollectionReference _profiles;

  CollectionReference _interests;

  DataService() {
    this._profiles = FirebaseFirestore.instance.collection('profiles');
    this._interests = FirebaseFirestore.instance.collection('interests');
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
        'picture': input.picture
      },
    );
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
}
