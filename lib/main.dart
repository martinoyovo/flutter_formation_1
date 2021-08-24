import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/students_list.dart';
import 'package:first_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:first_app/folder/formation_class.dart';

void main() async {
  runApp(MyApp());
  await Firebase.initializeApp();
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion Etudiants',
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.pink
      ),
      home: StudentsList(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StudentsList()
    );
  }
}

