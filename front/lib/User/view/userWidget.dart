import 'package:flutter/material.dart';
import 'package:proloapp/Leaderboard/controller/houseController.dart';
import 'package:proloapp/Leaderboard/model/name.dart';
import 'package:flutter/material.dart';

import '../../Leaderboard/model/house.dart';
import '../model/user.dart';

Color getColor(Name name) {
  List<House> houses = getAllHouses();
   return houses.where((house) => house.name == name).first.color;
}

Widget getUserWidget(User user, int index){
  Color color = getColor(user.house);
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
                  color: color,
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