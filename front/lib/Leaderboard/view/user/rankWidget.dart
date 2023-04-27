import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/user.dart';

Widget userRankWidget(int index, User user){
  int diff = (user.previousIndex ?? 0) - (user.newIndex ?? 0);

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
    icon = Icons.arrow_drop_up;
    color = Colors.transparent;
  }
  return Row(children: [
    Text(
      (index + 1).toString(),
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
              fontSize: 16,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    )
  ],);
}