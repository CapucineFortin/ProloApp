import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/name.dart';
import '../../model/user.dart';

Color getColor(Name name) {
  switch (name) {
    case Name.gryffindor:
      return const Color(0xffa6332e);
    case Name.slytherin:
      return const Color(0xff366447);
    case Name.hufflepuff:
      return const Color(0xffefbc2f);
    case Name.ravenclaw:
      return const Color(0xff3c4e91);
    default:
      return const Color(0xff000000);
  }
}

String decodeUtf8(String bytesString) {
  List<int> bytes = bytesString.codeUnits;
  Utf8Decoder utf8decoder = const Utf8Decoder(allowMalformed: true);
  return utf8decoder.convert(bytes);
}

Widget userScoreWidget(User user){
  return Container(
      width: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Color(0xffdf7f7f7),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    decodeUtf8(user.login),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: getColorFromHouse(user.house),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user.points.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
            )
          ]
      )
  );

}