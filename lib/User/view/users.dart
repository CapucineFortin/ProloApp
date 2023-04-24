import 'package:flutter/cupertino.dart';
import 'package:proloapp/User/view/userWidget.dart';
import '../controller/userController.dart';
import '../model/user.dart';

class UserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<User> users = sortedContestant();
    return Center (
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return getUserWidget(users[index],index);
            }
        )
    );
  }
}