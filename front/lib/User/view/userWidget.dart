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

Widget getUserWidget(User user, int index, int previousIndex) {
  int diff = user.previousIndex! - user.newIndex!;
  bool isUp = diff < 0;

  IconData icon;
  Color color;
  if (isUp) {
    icon = Icons.arrow_drop_up;
    color = Colors.green;
    diff = -diff; // on prend la valeur absolue de diff pour l'afficher
  } else {
    icon = Icons.arrow_drop_down;
    color = Colors.red;
  }

  return Container(
    height: 100,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color(0xffFFD700)
      ),
      gradient: const RadialGradient(
        colors: [Color(0xff003b48), Color(0xff09242e),],
        center: Alignment.center,
        radius: 1.5,
      ),
    ),
    child: Row(
      children: [
        Text(
          (index + 1).toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffFFD700)
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          height: 50,
          child: Column(
            children: [
              Icon(icon, color: color),
              Text(
                diff.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 100,
        ),
        SizedBox(
          height: 50,
          child: Column(
              children: [
                Text(
                  user.login,
                  style: TextStyle(
                    fontSize: 20,
                    color: getColorFromHouse(user.house),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user.points.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        )
      ],
    ),
  );
}