import 'dart:convert';
import 'dart:ui';

import 'name.dart';

class House {
  Name name;
  int points;
  Color color;
  List<String> members;

  House(this.name, this.points, this.color, this.members);

  factory House.fromJson(Map<String, dynamic> json) {
    Name name = getNamefromString(json['name']);
    return House(name, json['points'], getColorFromHouse(name),[]);
  }
}

List<House> houseListFromJson(String jsonString) {
  final jsonData = json.decode(jsonString) as List<dynamic>;
  return jsonData.map((json) => House.fromJson(json)).toList();
}