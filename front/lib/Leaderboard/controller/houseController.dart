import 'package:flutter/cupertino.dart';

import '../model/house.dart';
import '../model/name.dart';

List<House> getAllHouses() {
  House gryffindor = House(Name.gryffindor, 50, const Color(0xffa6332e),["adri"]);
  House slytherin = House(Name.slytherin, 60, const Color(0xff366447),["capu"]);
  House hufflepuff = House(Name.hufflepuff, 30, const Color(0xffefbc2f),["mel"]);
  House ravenclaw = House(Name.ravenclaw, 40, const Color(0xff3c4e91),["mira"]);
  return [gryffindor, slytherin, hufflepuff, ravenclaw];
}

List<House> sortedHouse(){
  List<House> houses = getAllHouses();
  houses.sort((a, b) => b.points.compareTo(a.points));
  return houses;
}