import '../../Leaderboard/model/name.dart';
import '../model/user.dart';

List<Contestant> getAllContestant() {
  return [
    Contestant("adri", Name.gryffindor, 50, "orga"),
    Contestant("capu", Name.slytherin, 60, "orga"),
    Contestant("mel", Name.hufflepuff, 30, "orga"),
    Contestant("mira", Name.ravenclaw, 40, "orga"),
  ];
}

List<Contestant> sortedContestant(){
  List<Contestant> contestants = getAllContestant();
  contestants.sort((a, b) => b.points.compareTo(a.points));
  return contestants;
}