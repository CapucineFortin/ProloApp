import 'package:flutter/material.dart';
import 'package:proloapp/Leaderboard/model/name.dart';
import 'package:proloapp/Leaderboard/view/house/rankWidget.dart';
import 'package:proloapp/Leaderboard/view/house/scoreWidget.dart';
import '../../model/house.dart';


Widget getTeamWidget(int index, House house){
  return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: house.color),
        borderRadius: BorderRadius.circular(30),
        gradient: const RadialGradient(
          colors: [Color(0xff003b48), Color(0xff09242e),],
          center: Alignment.center,
          radius: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            houseRankWidget(index, house),
            Container(
              padding: const EdgeInsets.only(right: 20),
              width: 200,
              child: houseScoreWidget(house))
          ]
      )
  );
}