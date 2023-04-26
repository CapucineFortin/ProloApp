import 'package:flutter/material.dart';
import 'package:proloapp/Leaderboard/controller/houseController.dart';
import 'package:proloapp/Leaderboard/model/name.dart';
import 'package:flutter/material.dart';

import '../../Leaderboard/model/house.dart';
import '../model/user.dart';

Color getColor(Name name) {
  switch (name) {
    case Name.gryffindor:
      return const Color(0xffa6332e);
    case Name.slytherin:
      return const Color(0xff366447);
    case Name.hufflepuff:
      return const Color(0xffefbc2f);
    case Name.ravenclaw:
      return const Color(0xff3c4e91);
    default:
      return const Color(0xff000000);
  }
}

Widget getUserWidget(User user, int index){
  return Container(
      height: 100,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
          children: [
            Text(
              (index+1).toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                user.login,
                style: TextStyle(
                  fontSize: 20,
                  color: getColorFromHouse(user.house),
                  fontWeight: FontWeight.bold,
                )
            ),
            Text(
                user.points.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )
            ),
          ]
      )
  );
}