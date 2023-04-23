import '../../Leaderboard/model/name.dart';

class Contestant {
  String login;
  Name house;
  double points;

  Contestant(this.login, this.house, this.points);
}