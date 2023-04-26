import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../model/house.dart';
import '../model/name.dart';

Future<List<House>> getAllHouse() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/users_manager/houses'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => House.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

Future<List<House>> sortedContestant() async {
  List<House> houses = await getAllHouse();
  houses.sort((a, b) => b.points.compareTo(a.points));
  return houses;
}