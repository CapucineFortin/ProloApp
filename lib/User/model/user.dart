import '../../Leaderboard/model/name.dart';

class Contestant {
  String login;
  Name house;
  double points;
  String type;

  Contestant(this.login, this.house, this.points, this.type);
}