import 'package:http/http.dart' as http;

import '../model/user.dart';

Future<List<User>> getAllUser() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/users_manager/contestants'));
  if (response.statusCode == 200) {
    return userListFromJson(response.body);
  } else {
    throw Exception(response.body);
  }
}

Future<List<User>> sortedContestant() async {
  List<User> users = await getAllUser();
  users.sort((a, b) => b.points.compareTo(a.points));
  return users;
}