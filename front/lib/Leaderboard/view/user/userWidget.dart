import 'package:flutter/material.dart';
import 'package:proloapp/Leaderboard/view/user/rankWidget.dart';
import 'package:proloapp/Leaderboard/view/user/scoreWidget.dart';

import '../../model/user.dart';

Widget getUserWidget(User user, int index, int previousIndex) {
  return Container(
    height: 80,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        userRankWidget(user),
        userScoreWidget(user),
      ],
    ),
  );
}