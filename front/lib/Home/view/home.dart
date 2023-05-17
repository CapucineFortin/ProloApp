import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:community_material_icon/community_material_icon.dart';
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
  final TextEditingController _textEditingController = TextEditingController();

  static const List<Widget> icons = <Widget>[
    Icon(FontAwesomeIcons.ticket),
    Icon(FontAwesomeIcons.chair),
    Icon(CommunityMaterialIcons.castle),
    Icon(Icons.music_note),
    Icon(CommunityMaterialIcons.microphone),
    Icon(FontAwesomeIcons.wolfPackBattalion),
    Icon(CommunityMaterialIcons.lipstick),
    Icon(CommunityMaterialIcons.treasure_chest),
    Icon(Icons.search),
    Icon(Icons.videogame_asset),
    Icon(Icons.question_mark),
    Icon(Icons.more_horiz)
  ];
  late List<bool> _selectedActivity = List.generate(icons.length, (_) => false);
  final List<String> _defaultPoints = ["5", "10", "10", "10","20", "10", "30", "5", "5", "10", "10", "0"];

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
            _textEditingController.text = _defaultPoints[index];
          });
        },
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedBorderColor: Colors.blue[700],
        selectedColor: Colors.white,
        fillColor: Colors.blue[200],
        color: Colors.blue[400],
        isSelected: _selectedActivity.sublist(0,6),
        children: icons.sublist(0,6),
      ),
      ToggleButtons(
        direction:  Axis.horizontal,
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < _selectedActivity.length; i++) {
              _selectedActivity[i] = i == index + 6 ;
            }
            _textEditingController.text = _defaultPoints[index+6];
          });
        },
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedBorderColor: Colors.blue[700],
        selectedColor: Colors.white,
        fillColor: Colors.blue[200],
        color: Colors.blue[400],
        isSelected: _selectedActivity.sublist(6),
        children: icons.sublist(6),
      ), 
        const SizedBox(height: 25),
        SizedBox(
        width: 100,
        child: TextField(
          controller: _textEditingController,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20
          )
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
                _selectedActivity = List.generate(icons.length, (_) => false);
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