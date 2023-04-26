import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proloapp/User/view/userWidget.dart';
import '../controller/userController.dart';
import '../model/user.dart';

class UserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center (
        child: FutureBuilder<List<User>>(
            future: sortedContestant(),
            builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erreur: ${snapshot.error}');
              } else {
                List<User> users = snapshot.data!;
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return getUserWidget(users[index], index);
                    }
                );
              }
            }
        )
    );
  }
}