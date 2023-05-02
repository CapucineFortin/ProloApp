import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import '../../Leaderboard/model/user.dart';
import '../controller/homeController.dart';
import '../controller/qrScan.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key, required this.qrValue}) : super (key: key);

  String qrValue;

  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState();
  }
}
class _HomeWidgetState extends State<HomeWidget> {
  late List<bool> _selectedActivity = <bool>[false, false, false, false, false];
  final TextEditingController _textEditingController = TextEditingController();

  static const List<Widget> icons = <Widget>[
    Icon(Icons.local_dining),
    Icon(Icons.videogame_asset),
    Icon(Icons.search),
    Icon(Icons.mic),
    Icon(Icons.music_note),
  ];

  @override
  Widget build(BuildContext context){
    final String qrValue = widget.qrValue;
    return Container (
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color(0xff003b48), Color(0xff09242e),],
            center: Alignment.center,
            radius: 1.5,
          ),
        ),
      child: Column(children: [
        const SizedBox(height: 200),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const QRReader(),
              ));},
            child: const Text('Scanner un QR code')),
        const SizedBox(height: 50),
        Text(
            widget.qrValue,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
        const SizedBox(height: 100),
        ToggleButtons(
        direction:  Axis.horizontal,
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < _selectedActivity.length; i++) {
              _selectedActivity[i] = i == index;
            }
          });
          _textEditingController.clear();
        },
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedBorderColor: Colors.blue[700],
        selectedColor: Colors.white,
        fillColor: Colors.blue[200],
        color: Colors.blue[400],
        isSelected: _selectedActivity,
        children: icons,
      ),
        const SizedBox(height: 25),
        const Text(
            'ou',
          style: TextStyle(
              color: Colors.white,
              fontSize: 15
          )),
        const SizedBox(height: 25),
        SizedBox(
        width: 100,
        child: TextField(
          controller: _textEditingController,
          onChanged: (value) {
            setState(() {
              _selectedActivity = <bool>[false, false, false, false, false];
            });
          }
        ),
      ),
        const SizedBox(height: 100),
        ElevatedButton(
        onPressed: () async {
          final int pointsToAdd = int.tryParse(_textEditingController.text) ?? 0 ;
          if (widget.qrValue == ""){
            ElegantNotification.info(
                title: const Text("Attention"),
                description: const Text(
                    "Tu n'as pas scanné de qrCode")
            ).show(context);
          }
          else if (pointsToAdd == 0) {
            ElegantNotification.info(
                title: const Text("Warning"),
                description: const Text(
                    "Tu n'as pas choisi le nombre de points à attribuer")
            ).show(context);
          } else {
            try {
              final User? user = await getContestant(qrValue.trim());
              await updateContestant(user!, pointsToAdd);
              ElegantNotification.success(
                  title: const Text("Success"),
                  description: Text(
                      "Tu as ajouté ${pointsToAdd.toString()} points à $qrValue")
              ).show(context);
              _textEditingController.clear();
              setState(() {
                _selectedActivity = <bool>[false, false, false, false, false];
              });
              widget.qrValue = "";
            } catch (e) {
              ElegantNotification.error(
                  title: const Text("Error"),
                  description: Text("L'ajout n'a pas fonctionné")
              ).show(context);
            }

          }
        },
        child: const Text("Valider"),
      ),
    ])
    );
  }
}