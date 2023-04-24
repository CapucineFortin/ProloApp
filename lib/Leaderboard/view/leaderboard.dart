import 'package:flutter/cupertino.dart';
import 'package:proloapp/Leaderboard/view/houseWidget.dart';
import '../controller/houseController.dart';
import '../model/house.dart';

class LeaderboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child:
        SizedBox(
          height: 500,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return getTeamWidget(index);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
          )
        )
    );
  }
}