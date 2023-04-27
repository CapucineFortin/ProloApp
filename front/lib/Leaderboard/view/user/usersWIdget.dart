import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proloapp/Leaderboard/view/user/userWidget.dart';
import '../../controller/userController.dart';
import '../../model/user.dart';


Widget usersWidget() {
  return Center(
      child: FutureBuilder<List<User>>(
          future: getAllUser(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erreur: ${snapshot.error}');
            } else {
              List<User> users = snapshot.data!;
              return ListView.separated(
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return getUserWidget(sort(users)[index], index, 0);
                    }, separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 5);
                  },
              );
            }
          }
      )
  );
}