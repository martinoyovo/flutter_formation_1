import 'package:first_app/corrections/excercice2_correction.dart';
import 'package:first_app/widgets/formulaires.dart';
import 'package:flutter/material.dart';


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
      //initialRoute: '/home',

      ///DEFINITION DES ROUTES
      routes: {
        "/home": (context) => MyHomePage(),
        "/formulaire": (context) => Formulaire()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("ENTRAINEMENT"),),
      body: Center(
        child: TextButton(
          child: Text("Aller à Profile"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return Formulaire();
            }));
          },
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))
          ),
        ),
      ),
    );
  }
}

