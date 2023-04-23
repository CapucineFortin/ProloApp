import '../../Leaderboard/model/name.dart';
import '../model/contestant.dart';

List<Contestant> getAllContestant() {
  return [
    Contestant("adri", Name.gryffindor, 50),
    Contestant("capu", Name.slytherin, 60),
    Contestant("mel", Name.hufflepuff, 30),
    Contestant("mira", Name.ravenclaw, 40),
  ];
}

List<Contestant> sortedContestant(){
  List<Contestant> contestants = getAllContestant();
  contestants.sort((a, b) => b.points.compareTo(a.points));
  return contestants;
}