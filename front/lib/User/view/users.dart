import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proloapp/User/view/userWidget.dart';
import '../controller/userController.dart';
import '../model/user.dart';

class UserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color(0xff003b48), Color(0xff09242e),],
            center: Alignment.center,
            radius: 1.5,
          ),
        ),
        child: Center(
          child: FutureBuilder<List<User>>(
            future: getAllUser(),
            builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erreur: ${snapshot.error}');
              } else {
                List<User> users = snapshot.data!;
                return SizedBox(
                  width: 500,
                    child: ListView.separated(
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return getUserWidget(sort(users)[index], index, 0);
                    }, separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 20);
                },
                )
                );
              }
            }
        )
      )
    );
  }
}