import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutteretudiant/authentification/connexion_email_auth_page.dart';
import 'package:flutteretudiant/authentification/inscription_email_auth_page.dart';
import 'package:flutteretudiant/authentification/phone_auth_page.dart';
import 'firebase_project/students_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
      home: ConnexionEmailAuthPage(),
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