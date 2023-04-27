import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controller/houseController.dart';
import '../../model/house.dart';
import 'houseWidget.dart';

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
          height: 400,
          width: 300,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return getTeamWidget(index, houses[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10);
            },
          ),
        ),
      );
    },
  );
}