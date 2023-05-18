import 'dart:convert';

import 'name.dart';

class User {
  String login;
  Name house;
  int points;
  int? rank;
  int? progress;
  bool? hasEaten;

  User(this.login, this.house, this.points, this.rank, this.progress, this.hasEaten);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['username'] as String,
      getNamefromString(json['house']),
      json['score'] as int,
      json['rank'] as int?,
      json['progress'] as int?,
      json['hasEaten'] as bool?
    );
  }
}

List<User> userListFromJson(String jsonString) {
  final jsonData = json.decode(jsonString) as List<dynamic>;
  return jsonData.map((json) => User.fromJson(json)).toList();
}