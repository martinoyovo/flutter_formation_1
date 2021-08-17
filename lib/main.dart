import 'package:first_app/models/person_page.dart';
import 'package:first_app/widgets/text_widgets.dart';
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
        primaryColor: Colors.pink,
      ),
      home: PersonList(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: textWidgets()
    );
  }
}

