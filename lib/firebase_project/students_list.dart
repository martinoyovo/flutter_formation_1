import 'package:flutteretudiant/firebase_project/add_student.dart';
import 'package:flutteretudiant/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class StudentsList extends StatelessWidget {
  const StudentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("liste des étudiants".toUpperCase()),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          ///TO GO STUDENT FORM PAGE
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => AddStudent()
          ));
        },
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 15),
        children: [
          CustomCard(),
          CustomCard(),
        ],
      ),
    );
  }
}
