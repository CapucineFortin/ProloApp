import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proloapp/Leaderboard/view/house/housesWidget.dart';
import 'package:proloapp/Leaderboard/view/user/usersWIdget.dart';

class LeaderboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [Color(0xff003b48), Color(0xff09242e),],
          center: Alignment.center,
          radius: 1.5,
        ),
      ),
      child: Column(children: [
        SizedBox(
          height: 300,
          child: housesWidget(),
        ),
        Container(
          width: 450,
          height: 800,
          padding: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70),
            topRight: Radius.circular(70)
            )
          ),
          child: usersWidget(),
          )
        ],)
    );
  }
}