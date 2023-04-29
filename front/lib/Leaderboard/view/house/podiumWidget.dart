import 'package:flutter/cupertino.dart';
import 'package:proloapp/Leaderboard/view/house/stepWidget.dart';

import '../../model/house.dart';

Widget housesPodiumWidget(List<House> houses){
  int maxPoints = houses[0].points;
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: houseStepWidget(houses[2], 2, maxPoints)),
        Expanded(child: houseStepWidget(houses[0], 0, maxPoints),),
        Expanded(child: houseStepWidget(houses[1], 1, maxPoints),),
        Expanded(child: houseStepWidget(houses[3], 3, maxPoints),)
      ],
    )
  );
}