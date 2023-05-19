import 'package:flutter/cupertino.dart';
import 'package:proloapp/Leaderboard/model/name.dart';
import 'package:proloapp/Leaderboard/view/house/rankWidget.dart';
import 'package:proloapp/Leaderboard/view/house/scoreWidget.dart';

import '../../model/house.dart';

Widget houseStepWidget(House house, int rank, int maxPoint){
  return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text(
                house.name.stringify(),
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white
                )
            ),
            houseRankWidget(rank, house),
            Container(
              height: maxPoint != 0 ? 50 + (house.points /maxPoint*100) : 20,
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
  );
}