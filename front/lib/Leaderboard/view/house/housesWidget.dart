import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proloapp/Leaderboard/view/house/podiumWidget.dart';
import '../../controller/houseController.dart';
import '../../model/house.dart';

Widget housesWidget() {
  return FutureBuilder<List<House>>(
    future: sortedHouses(),
    builder: (BuildContext context, AsyncSnapshot<List<House>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Center(child: Text('Erreur: ${snapshot.error}'));
      }
      final houses = snapshot.data!;
      return Center(
        child: SizedBox(
          width: 350,
          child: housesPodiumWidget(houses)
        ),
      );
    },
  );
}