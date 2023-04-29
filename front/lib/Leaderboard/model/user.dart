import 'dart:convert';

import 'name.dart';

class User {
  String login;
  Name house;
  int rank;
  int points;
  int progress;

  User(this.login, this.house, this.rank, this.points, this.progress);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['username'] as String,
      getNamefromString(json['house']),
      json['rank'] as int,
      json['score'] as int,
      json['progress'] as int,
    );
  }
}

List<User> userListFromJson(String jsonString) {
  final jsonData = json.decode(jsonString) as List<dynamic>;
  return jsonData.map((json) => User.fromJson(json)).toList();
}