import 'dart:convert';

import '../../Leaderboard/model/user.dart';

import 'package:http/http.dart' as http;


Future<User?> getContestant(String login) async {
  final response = await http.get(Uri.parse('http://88.126.10.70:34/finale/contestant/$login/'));
  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    return User.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load contestant: $login');
  }
}

Future<void> updateContestant(User contestant, int points, int activity) async {
  final response = await http.post(
    Uri.parse('http://88.126.10.70:34/finale/score/${contestant.login}/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'points': points,
      'point_type': activity,
    }),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update contestant');
  }
}