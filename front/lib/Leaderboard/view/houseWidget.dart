import 'package:flutter/material.dart';
import 'package:proloapp/Leaderboard/model/name.dart';
import '../controller/houseController.dart';
import '../model/house.dart';
import 'package:flutter/material.dart';

Color getColor(int index) {
  switch (index) {
    case 0:
      return const Color(0xFFFFD700);
    case 1:
      return const Color(0xFFC0C0C0);
    case 2:
      return const Color(0xFFCD7F32);
    default:
      return Colors.black;
  }
}

Widget getTeamWidget(int index, House house){
  Color color = getColor(index);

  return Container(
      height: 100,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: house.color,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 50,
              child: Row(children: [
                Text(
                  (index+1).toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                    Icons.emoji_events,
                    color: color
                ),
              ],),
            ),
            Text(
                house.name.stringify(),
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )
            ),
            Text(
                house.points.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )
            ),
          ]
      )
  );
}