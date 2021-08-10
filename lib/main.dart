import 'package:flutter/material.dart';
import 'package:first_app/folder/formation_class.dart';
import 'package:first_app/screen/visit_card.dart';

void main() {

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ma carte de visite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VisitCard(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HELLO", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.amber),),
      ),
    );
  }
}

