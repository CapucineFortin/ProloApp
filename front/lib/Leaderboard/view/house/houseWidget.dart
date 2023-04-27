import 'package:flutter/material.dart';
import 'package:proloapp/Leaderboard/model/name.dart';
import 'package:proloapp/Leaderboard/view/house/rankWidget.dart';
import 'package:proloapp/Leaderboard/view/house/scoreWidget.dart';
import '../../model/house.dart';


Widget getTeamWidget(int index, House house){
  return Container(
      height: 60,
      decoration: BoxDecoration(
        color: house.color,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            houseRankWidget(index, house),
            Container(
              padding: EdgeInsets.only(right: 20),
              width: 200,
              child: houseScoreWidget(house))
          ]
      )
  );
}