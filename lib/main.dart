import 'package:first_app/screen/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:first_app/folder/formation_class.dart';
import 'package:first_app/screen/visit_card.dart';
import 'package:first_app/screen/visit_card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_project/students_list.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false;
        title: 'Gestion Etudiants',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

