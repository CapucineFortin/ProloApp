import 'package:flutter/material.dart';
import 'package:proloapp/User/view/users.dart';
import 'package:proloapp/Home/view/home.dart';

import 'Leaderboard/view/leaderboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(qrValue: ''),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.qrValue}) : super(key: key);

  final String qrValue;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: DefaultTabController(
            initialIndex: 0,
            length: 3,
            child: Scaffold(
                bottomNavigationBar: const BottomAppBar(
                  child : TabBar(
                    labelColor: Colors.black,
                    tabs: [
                      Tab(icon: Icon(Icons.leaderboard)),
                      Tab(icon: Icon(Icons.home)),
                      Tab(icon: Icon(Icons.person)),
                    ],
                  ),
                ),
                body: TabBarView(
                    children: [
                      LeaderboardWidget(),
                      HomeWidget(qrValue: qrValue),
                    ])
            )
        )
    );
  }
}