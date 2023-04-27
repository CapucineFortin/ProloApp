import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/house.dart';

Color getColor(int index) {
  switch (index) {
    case 0:
      return const Color(0xFFFFD700);
    case 1:
      return const Color(0xFFC0C0C0);
    case 2:
      return const Color(0xFFCD7F32);
    default:
      return Colors.black;
  }
}

Widget houseRankWidget(int index, House house){
  return SizedBox(
    width: 100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(
        (index+1).toString(),
        style: TextStyle(
          fontSize: 20,
          color: getColor(index),
          fontWeight: FontWeight.bold,
        ),
      ),
      Icon(
          Icons.emoji_events,
          color: getColor(index)
      ),
    ],),
  );
}