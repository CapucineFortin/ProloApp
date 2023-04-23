import 'package:flutter/cupertino.dart';
import 'package:proloapp/Leaderboard/view/houseWidget.dart';
import '../controller/contestantController.dart';
import '../model/contestant.dart';

class ContestantWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Contestant> contestants = sortedContestant();
    return Center (
        child: ListView.builder(
            itemCount: contestants.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(contestants[index].login.toString());
            }
        )
    );
  }
}