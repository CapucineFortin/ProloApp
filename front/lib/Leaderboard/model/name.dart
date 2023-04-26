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
      return Colors.red;
    case Name.slytherin:
      return Colors.green;
    case Name.hufflepuff:
      return Colors.yellow;
    case Name.ravenclaw:
      return Colors.blue;
    default:
      return Colors.black;
  }
}


