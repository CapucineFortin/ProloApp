import 'package:flutter/material.dart';

import '../../model/user.dart';

Widget userRankWidget(User user){
  int diff = user.progress;
  IconData icon;
  Color color;
  if (diff < 0) {
    icon = Icons.arrow_drop_up;
    color = Colors.green;
    diff = -diff;
  } else if(diff > 0) {
    icon = Icons.arrow_drop_down;
    color = Colors.red;
  }
  else {
    icon = Icons.remove;
    color = Colors.black;
  }
  return Row(children: [
    Text(
      (user.rank).toString(),
      style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),
    ),
    SizedBox(
      height: 50,
      child: Column(
        children: [
          Icon(icon, color: color),
          Text(
            diff.toString(),
            style: TextStyle(
              fontSize: 15,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    )
  ],);
}