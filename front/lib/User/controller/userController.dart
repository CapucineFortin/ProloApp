import '../../Leaderboard/model/name.dart';
import '../model/user.dart';

List<User> getAllContestant() {
  return [
    User("adri", Name.gryffindor, 50, "orga"),
    User("capu", Name.slytherin, 60, "orga"),
    User("mel", Name.hufflepuff, 30, "orga"),
    User("mira", Name.ravenclaw, 40, "orga"),
  ];
}

List<User> sortedContestant(){
  List<User> users = getAllContestant();
  users.sort((a, b) => b.points.compareTo(a.points));
  return users;
}