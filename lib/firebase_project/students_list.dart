import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/firebase_project/add_student.dart';
import 'package:first_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class StudentsList extends StatelessWidget {
  const StudentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference liste_etudiants = FirebaseFirestore.instance.collection("liste_etudiants");
    /*
    * snapshot.hasData
    * snapshot.hasError
    * snapshot.data
    * snapshot.connectionState == ConnectionState.waiting
    * snapshot.connectionState == ConnectionState.none
    * */
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
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          if(snapshot.hasData) {
            print(snapshot.data!.docs.length);
            return ListView.builder(
              padding: EdgeInsets.only(top: 15),
              itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                final document = snapshot.data!.docs[index];
                  return CustomCard(studentInfos: document);
                });
          }
          else if(snapshot.hasError) {
            return Center(
              child: Text("Une erreur s'est produite."),
            );
          }
          else if(snapshot.connectionState == ConnectionState.waiting) {

          }

          else {

          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )

      /*ListView(
        padding: EdgeInsets.only(top: 15),
        children: [
          CustomCard(),
          CustomCard(),
        ],
      ),*/
    );
  }
}
