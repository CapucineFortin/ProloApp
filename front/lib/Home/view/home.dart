import 'package:flutter/material.dart';
import 'package:proloapp/Leaderboard/controller/userController.dart';
import '../../Leaderboard/model/user.dart';
import '../controller/homeController.dart';
import '../controller/qrScan.dart';

class HomeWidget extends StatelessWidget {
  String qrValue;
  String test ='anton.avilov';
  final TextEditingController _textEditingController = TextEditingController();
  HomeWidget({Key? key, required this.qrValue}) : super (key: key);


  @override
  Widget build(BuildContext context){
    return Container (
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color(0xff003b48), Color(0xff09242e),],
            center: Alignment.center,
            radius: 1.5,
          ),
        ),
      child: Column(children: [
      const SizedBox(width: 500, height: 300),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRReader(),
            ));},
          child: const Text('Scan QR code')),
      Text(qrValue),
      const SizedBox(
        height: 70,
      ),
      SizedBox(
        width: 100,
        child: TextField(controller: _textEditingController),
      ),
      const SizedBox(
        height: 30,
      ),
      ElevatedButton(
        onPressed: () async {

          final User? user = await getContestant(test);

          final int pointsToAdd = int.tryParse(_textEditingController.text) ?? 0;
          await updateContestant(user!, pointsToAdd);

          _textEditingController.clear();
        },
        child: const Text("Valider"),
      ),
    ])
    );
  }
}