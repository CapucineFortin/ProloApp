import 'dart:convert';

import 'package:proloapp/Leaderboard/model/name.dart';

import '../../User/model/user.dart';

import 'package:http/http.dart' as http;


Future<User?> getContestant(String login) async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/users_manager/contestant/$login/'));
  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    return User.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load contestant: $login');
  }
}

Future<void> updateContestant(User contestant, int points) async {
  contestant.points += points;
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8000/users_manager/setcontestant/loan.bernable/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'score': contestant.points,
    }),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update contestant');
  }
}