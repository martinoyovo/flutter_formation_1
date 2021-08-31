import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nomC = TextEditingController();
    TextEditingController prenomC = TextEditingController();
    TextEditingController ageC = TextEditingController();
    TextEditingController noteC = TextEditingController();

    ///DEFINE DATABASE COLLECTION
    CollectionReference liste_etudiants = FirebaseFirestore.instance.collection("liste_etudiants");

    Future<void> addStudent(Map<String,dynamic> student) async {
      await liste_etudiants.add(student);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("AJOUTER UN ETUDIANT"),
        elevation: 0,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          children: [
            SizedBox(height: 20,),
            TextFormField(
              controller: prenomC,
              decoration: InputDecoration(
                labelText: "Prénom",
                border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: nomC,
              decoration: InputDecoration(
                labelText: "Nom",
                border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: ageC,
              decoration: InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: noteC,
              decoration: InputDecoration(
                labelText: "Note",
                border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 20)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
                ),
                onPressed: () {
                  addStudent(
                      {
                        "nom": nomC.text,
                        "prenom": prenomC.text,
                        "age": ageC.text,
                        "note": noteC.text
                      });
                },
                child: Text("Ajouter", style: TextStyle(fontSize: 17),)
            )
          ],
        ),
      ),
    );
  }
}
