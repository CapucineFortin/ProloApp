import '../../Leaderboard/model/name.dart';

class User {
  String login;
  Name house;
  double points;
  String type;

  User(this.login, this.house, this.points, this.type);
}