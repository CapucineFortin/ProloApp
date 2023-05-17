import 'dart:convert';

import '../../Leaderboard/model/user.dart';

import 'package:http/http.dart' as http;


Future<User?> getContestant(String login) async {
  final response = await http.get(Uri.parse('https://proloapp.herokuapp.com/finale/contestant/$login/'));
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
    Uri.parse('https://proloapp.herokuapp.com/finale/setcontestant/${contestant.login}/'),
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