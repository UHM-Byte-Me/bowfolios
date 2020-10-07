import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  String id;
  String fName;
  String lName;
  String bio;
  String title;
  String picture;
  List<String> interests;
  List<String> projects;

  Profile({
    this.id,
    this.fName,
    this.lName,
    this.bio,
    this.title,
    this.picture,
    this.interests,
    this.projects,
  });

  factory Profile.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    if (data == null) {
      data = {};
    }

    return Profile(
      id: doc.id ?? "",
      fName: data["fName"] ?? "",
      lName: data["lName"] ?? "",
      bio: data["bio"] ?? "",
      title: data["title"] ?? "",
      picture: data["picture"] ?? "",
      interests: data["interests"] ?? [],
      projects: data["projects"] ?? [],
    );
  }
}

class Interest {
  String id;
  String name;
  Object users;

  Interest({
    this.id,
    this.name,
    this.users,
  });

  factory Interest.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Interest(
      id: doc.id,
      name: data["name"],
      users: data["users"] ?? {},
    );
  }
}

class Project {
  String id;
  String name;
  String homePage;
  String description;
  String picture;
  List<String> interests;

  Project({
    this.id,
    this.name,
    this.homePage,
    this.description,
    this.picture,
    this.interests,
  });

  factory Project.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Project(
      id: doc.id,
      name: data["name"] ?? "",
      homePage: data["homePage"],
      description: data["description"] ?? "",
      picture: data["picture"] ?? "",
      interests: data["interests"] ?? "",
    );
  }
}
