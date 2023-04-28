import 'package:flutter/cupertino.dart';
import 'package:proloapp/Leaderboard/model/name.dart';
import 'package:proloapp/Leaderboard/view/house/rankWidget.dart';
import 'package:proloapp/Leaderboard/view/house/scoreWidget.dart';

import '../../model/house.dart';

Widget houseStepWidget(House house, int rank, int maxPoint){
  return Center(
    child: Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            houseScoreWidget(house),
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
            )
          ],
        ),
      ],
    )
  );
}