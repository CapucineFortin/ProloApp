import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import '../../Leaderboard/model/user.dart';
import '../controller/homeController.dart';
import '../controller/qrScan.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key, required this.qrValue}) : super (key: key);

  final String qrValue;

  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState();
  }
}
class _HomeWidgetState extends State<HomeWidget> {
  String test ='anton.avilov';
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
            child: const Text('Scan QR code')),
        Text(widget.qrValue),
        ToggleButtons(
        direction:  Axis.horizontal,
        onPressed: (int index) {
          setState(() {
            // The button that is tapped is set to true, and the others to false.
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
          if (pointsToAdd == 0) {
            ElegantNotification.info(
                title: const Text("Warning"),
                description: const Text(
                    "Tu n'as choisi le nombre de points à attribuer")
            ).show(context);
          } else {
            try {
              final User? user = await getContestant(test);
              await updateContestant(user!, pointsToAdd);
              ElegantNotification.success(
                  title: const Text("Success"),
                  description: Text(
                      "Tu as ajouté ${pointsToAdd.toString()} points à $test")
              ).show(context);
            } catch (e) {
              ElegantNotification.error(
                  title: const Text("Error"),
                  description: Text("Le compte de $test n'a pas été trouvé")
              ).show(context);
            }
            _textEditingController.clear();
            setState(() {
              _selectedActivity = <bool>[false, false, false, false, false];
            });
          }
        },
        child: const Text("Valider"),
      ),
    ])
    );
  }
}