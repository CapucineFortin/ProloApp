import '../../Leaderboard/model/house.dart';

class Contestant {
  String login;
  House house;
  double points;

  Contestant(this.login, this.house, this.points);
}