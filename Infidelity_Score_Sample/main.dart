import 'package:flutter/material.dart';
import 'scores_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // Example inputs  (rival name and timestamps may not be together with partnerName and score, change scores_page inputs accordingly)
  var list = [
    ScoresPage('NomNom',1.0,'rivalname1','timestamp1','rivalname2','timestamp2'),
    ScoresPage('NumNum',1.0,'rivalname1','timestamp1','rivalname2','timestamp2'),
    ScoresPage('NemNem',1.0,'rivalname1','timestamp1','rivalname2','timestamp2'),
  ];


  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            for (var item in list)
              item.build(context),
          ],
        ),
      ),
    );
  }
}

