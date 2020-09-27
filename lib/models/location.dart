import 'location_fact.dart';

class Location {
  final int id;
  String name;
  final List<LocationFact> facts;

  Location(this.id, this.name, this.facts);

  static List<Location> fetchAll() {
    return [
      Location(1, 'Location 1 NAME', [
        LocationFact('Location 1 FACT 1 TITLE', 'Location 1 FACT 2 SUMMARY'),
        LocationFact('Location 1 FACT 1 TITLE', 'Location 1 FACT 1 SUMMARY'),
      ]),
      Location(2, 'Location 2 NAME', [
        LocationFact('Location 2 FACT 2 TITLE', 'Location 2 FACT 2 SUMMARY'),
        LocationFact('Location 2 FACT 2 TITLE', 'Location 2 FACT 2 SUMMARY'),
      ])
    ];
  }
}
