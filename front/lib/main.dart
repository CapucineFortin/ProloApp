import 'package:flutter/material.dart';
import 'package:proloapp/Home/view/home.dart';

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
      home: MyHomePage(qrValue: ''),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //late Auth0? autho0;
  MyHomePage({Key? key, required this.qrValue}) : super(key: key);

  final String qrValue;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: DefaultTabController(
            initialIndex: 1,
            length: 2,
            child: Scaffold(
                bottomNavigationBar: const BottomAppBar(
                  child : TabBar(
                    labelColor: Colors.black,
                    tabs: [
                      Tab(icon: Icon(Icons.leaderboard)),
                      Tab(icon: Icon(Icons.home)),
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