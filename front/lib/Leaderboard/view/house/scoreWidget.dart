import 'package:flutter/cupertino.dart';
import 'package:proloapp/Leaderboard/model/name.dart';

import '../../model/house.dart';

Widget houseScoreWidget(House house){
  return Center(child:
    Text(
      house.points.toString(),
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: CupertinoColors.white
      )
   )
  );
}