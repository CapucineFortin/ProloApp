import 'package:flutter/material.dart';
import 'package:proloapp/Leaderboard/model/name.dart';
import 'package:proloapp/Leaderboard/view/house/rankWidget.dart';
import '../../model/house.dart';


Widget getTeamWidget(int index, House house){
  return Container(
      height: 50,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: house.color,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            houseRankWidget(index, house),
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