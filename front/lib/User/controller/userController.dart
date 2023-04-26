import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/user.dart';

Future<List<User>> getAllUser() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/users_manager/users'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

Future<List<User>> sortedContestant() async {
  List<User> users = await getAllUser();
  users.sort((a, b) => b.points.compareTo(a.points));
  return users;
}