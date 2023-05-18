import 'package:flutter/material.dart';
import 'package:proloapp/Home/view/home.dart';
import 'package:proloapp/Meal/view/meal.dart';

import 'Leaderboard/view/leaderboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(qrValue: '', page: 1),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.qrValue, required this.page}) : super(key: key);

  final String qrValue;
  final int page;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: DefaultTabController(
            initialIndex: page,
            length: 3,
            child: Scaffold(
                bottomNavigationBar: const BottomAppBar(
                  child : TabBar(
                    labelColor: Colors.black,
                    tabs: [
                      Tab(icon: Icon(Icons.leaderboard)),
                      Tab(icon: Icon(Icons.home)),
                      Tab(icon: Icon(Icons.local_dining))
                    ],
                  ),
                ),
                body: TabBarView(
                    children: [
                      LeaderboardWidget(),
                      HomeWidget(qrValue: qrValue),
                      MealWidget(qrValue: qrValue)
                    ])
            )
        )
    );
  }
}