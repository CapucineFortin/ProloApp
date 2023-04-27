import 'package:flutter/cupertino.dart';
import 'package:proloapp/Leaderboard/model/name.dart';

import '../../model/house.dart';

Widget houseScoreWidget(House house){
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
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
      )
  ]);
}