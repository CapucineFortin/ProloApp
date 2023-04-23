import 'package:flutter/material.dart';
import 'package:proloapp/Leaderboard/model/name.dart';

import '../model/house.dart';

Widget getTeamWidget(House house){
  return Container(
      height: 50,
      width: 60,
      decoration: BoxDecoration(
          color: house.color,
      ),
      child: Column(
          children: [
            Text(house.name.stringify()),
            Text(house.points.toString()),
          ]
      )
  );
}