import 'package:flutter/cupertino.dart';
import 'package:proloapp/Leaderboard/view/houseWidget.dart';
import '../controller/houseController.dart';
import '../model/house.dart';

class LeaderboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<House> houses = sortedHouse();
    return Center (
        child: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return getTeamWidget(houses[index]);
        }
    )
    );
  }
}