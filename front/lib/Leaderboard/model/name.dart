import 'dart:ui';

import 'package:flutter/material.dart';

enum Name {
  gryffindor,
  slytherin,
  hufflepuff,
  ravenclaw
}

extension NameExtension on Name {
  String stringify() {
    switch (this) {
      case Name.gryffindor:
        return "Gryffindor";
      case Name.slytherin:
        return "Slytherin";
      case Name.hufflepuff:
        return "Hufflepuff";
      case Name.ravenclaw:
        return "Ravenclaw";
      default:
        return "";
    }
  }
}

Name getNamefromString(String value) {
  switch (value) {
    case "Gryffindor":
      return Name.gryffindor;
    case "Slytherin":
      return Name.slytherin;
    case "Hufflepuff":
      return Name.hufflepuff;
    case "Ravenclaw":
      return Name.ravenclaw;
    default:
      throw ArgumentError("Invalid value for Name: $value");
  }
}

Color getColorFromHouse(Name house) {
  switch (house) {
    case Name.gryffindor:
      return Color(0xffef476f);
    case Name.slytherin:
      return Color(0xff06d6a0);
    case Name.hufflepuff:
      return Color(0xffffd166);
    case Name.ravenclaw:
      return Color(0xff26547c);
    default:
      return Colors.black;
  }
}


