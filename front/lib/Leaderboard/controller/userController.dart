import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/user.dart';

Future<List<User>> getAllUser() async {
  final response = await http.get(Uri.parse('http://88.126.10.70:34/finale/leaderboard/'));

  if (response.statusCode == 200) {
    return userListFromJson(response.body);
  } else {
    throw Exception(response.body);
  }
}