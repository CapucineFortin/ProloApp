import 'package:flutter/cupertino.dart';
import 'package:proloapp/Leaderboard/model/name.dart';
import 'package:proloapp/Leaderboard/view/house/rankWidget.dart';
import 'package:proloapp/Leaderboard/view/house/scoreWidget.dart';

import '../../model/house.dart';

Widget houseStepWidget(House house, int rank, int maxPoint){
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
                house.name.stringify(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white
                )
            ),
            houseRankWidget(rank, house),
            Container(
              height: 50 + (house.points /maxPoint*100),
              width: 50,
              decoration: BoxDecoration(
                color: getColorFromHouse(house.name),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)
                )
              ),
              child: houseScoreWidget(house)
            )
          ],
        ),
      ],
    )
  );
}