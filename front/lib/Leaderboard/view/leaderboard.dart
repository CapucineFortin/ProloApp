import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proloapp/Leaderboard/view/houseWidget.dart';
import '../controller/houseController.dart';
import '../model/house.dart';

class LeaderboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<House>>(
      future: getAllHouse(),
      builder: (BuildContext context, AsyncSnapshot<List<House>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Failed to fetch houses'));
        }
        final houses = snapshot.data!;
        return Center(
          child: SizedBox(
            height: 500,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return getTeamWidget(index, houses[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 20);
              },
            ),
          ),
        );
      },
    );
  }
}