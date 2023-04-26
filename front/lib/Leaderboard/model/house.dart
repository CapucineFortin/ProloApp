import 'dart:ui';

import 'name.dart';

class House {
  Name name;
  int points;
  Color color;
  List<String> members;

  House(this.name, this.points, this.color, this.members);

  factory House.fromJson(Map<String, dynamic> json) {
    return House(json['name'], json['points'], json['color'], json['members']);
  }
}