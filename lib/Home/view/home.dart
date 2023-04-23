import 'package:flutter/material.dart';
import '../controller/qrScan.dart';

class HomeWidget extends StatelessWidget {
  String qrValue;
  HomeWidget({Key? key, required this.qrValue}) : super (key: key);


  @override
  Widget build(BuildContext context){
    return Column(children: [
      const SizedBox(width: 500, height: 500),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRReader(),
            ));},
          child: Text('Scan QR code')),
      Text(qrValue),
      const SizedBox(
        height: 70,
      ),
      const TextField(),
      const SizedBox(
        height: 30,
      ),
      ElevatedButton(
        onPressed: () => {},
        child:
          const Text("Valider")
      ),
    ]
    );
  }
}