import 'dart:convert';

import '../../Leaderboard/model/name.dart';

class User {
  String login;
  Name house;
  int points;

  User(this.login, this.house, this.points);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['username'] as String,
      getNamefromString(json['house']),
      json['score'] as int,
    );
  }
}

List<User> userListFromJson(String jsonString) {
  final jsonData = json.decode(jsonString) as List<dynamic>;
  return jsonData.map((json) => User.fromJson(json)).toList();
}