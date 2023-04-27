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

List<User> sorted(List<User> users) {
  for (int i = 0; i < users.length; i++) {
    users[i].previousIndex = i;
  }
  users.sort((a, b) => b.points.compareTo(a.points));
  for (int i = 0; i < users.length; i++) {
    users[i].newIndex = i;
  }
  return users;
}

int getIndex(List<User> users, String login){
  for (int i=0; i<users.length;i++){
    if (users[i].login == login){
      return i;
    }
  }
  return -1;
}