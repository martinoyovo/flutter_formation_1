import 'package:first_app/corrections/excercice2_correction.dart';
import 'package:first_app/widgets/text_widgets.dart';
import 'package:first_app/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:first_app/folder/formation_class.dart';


void main() {

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("ENTRAINEMENT"),),
      body: profile()
    );
  }
}

