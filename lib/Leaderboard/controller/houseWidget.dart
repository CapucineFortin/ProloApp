import 'package:flutter/cupertino.dart';

import '../model/house.dart';

List<House> sortedHouse(List<House> houses){
  return houses;
}

Widget getTeamWidget(House house){
  return Container(
    decoration: BoxDecoration(
      color: house.color
    ),
    child: Text(house.name.toString())
  );
}