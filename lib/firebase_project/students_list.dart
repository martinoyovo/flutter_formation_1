import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/firebase_project/add_student.dart';
import 'package:first_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class StudentsList extends StatelessWidget {
  ///DEFINE DATABASE COLLECTION
  CollectionReference liste_etudiants = FirebaseFirestore.instance.collection("liste_etudiants");


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
        body: StreamBuilder(
          stream: liste_etudiants.snapshots(),

          builder:
              (BuildContext context, AsyncSnapshot snapshot) {

            if (snapshot.hasError) {
              return Text("Something went wrong");
            }



            if (snapshot.connectionState == ConnectionState.done || snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.only(top: 10),
                //Obtenir la longeur de la liste
                itemCount: snapshot.data!.docs.length ,
                itemBuilder: (BuildContext context, int index){
                  return CustomCard(studentInfos: snapshot.data!.docs[index]);
                },
              );
            }else{
              return Text("loading");
            }

          },
        )
    );
  }
}
