import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  final String id;
  final String fName;
  final String lName;
  final String bio;
  final String title;
  final String picture;

  Profile({
    this.id,
    this.fName,
    this.lName,
    this.bio,
    this.title,
    this.picture,
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
    );
  }
}

class Interest {
  final String id;
  final String name;

  Interest({this.id, this.name});

  factory Interest.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Interest(
      id: doc.id,
      name: data["name"],
    );
  }
}

class Project {
  final String id;
  final String name;
  final String homePage;
  final String description;
  final String picture;

  Project({this.id, this.name, this.homePage, this.description, this.picture});

  factory Project.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Project(
      id: doc.id,
      name: data["name"],
      homePage: data["homePage"],
      description: data["description"],
      picture: data["picture"],
    );
  }
}

class ProfileInterests {
  final String id;
  final String profile;
  final String interest;

  ProfileInterests({this.id, this.profile, this.interest});
}

class ProfileProjects {
  final String id;
  final String profile;
  final String project;

  ProfileProjects({this.id, this.profile, this.project});
}

class ProjectInterests {
  final String id;
  final String project;
  final String interest;

  ProjectInterests({this.id, this.project, this.interest});
}
