import 'package:http/http.dart' as http;


import '../model/house.dart';

Future<List<House>> getAllHouse() async {
  final response = await http.get(Uri.parse('http://88.126.10.70:34/finale/houses/'));
  if (response.statusCode == 200) {
    return houseListFromJson(response.body);
  } else {
    throw Exception(response.body);
  }
}

Future<List<House>> sortedHouses() async {
  List<House> houses = await getAllHouse();
  houses.sort((a, b) => b.points.compareTo(a.points));
  return houses;
}