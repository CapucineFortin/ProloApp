import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/name.dart';
import '../../model/user.dart';
import 'badgeWidget.dart';

String decodeUtf8(String bytesString) {
  List<int> bytes = bytesString.codeUnits;
  Utf8Decoder utf8decoder = const Utf8Decoder(allowMalformed: true);
  return utf8decoder.convert(bytes);
}

Widget userScoreWidget(User user){
  return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        color: const Color(0xfff7f7f7),
        border: Border.all(
            color: getColorFromHouse(user.house)
        )
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
            ),
            Expanded(
                flex: 3,
                child: userBadgesWidget([0,1,2,3,4,5,6,7,8,9,10,11]))
          ]
      )
  );

}