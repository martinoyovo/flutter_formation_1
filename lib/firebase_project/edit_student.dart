import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditStudent extends StatelessWidget {
  final String documentID;

  const EditStudent({Key? key, required this.documentID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nomC = TextEditingController();
    TextEditingController prenomC = TextEditingController();
    TextEditingController ageC = TextEditingController();
    TextEditingController noteC = TextEditingController();

    ///DEFINE DATABASE COLLECTION
    CollectionReference liste_etudiants = FirebaseFirestore.instance.collection("liste_etudiants");

    Future<void> addStudent(Map<String,dynamic> student) async {
      await liste_etudiants.doc(this.documentID).update(student);
    }
    ///Validation Key du formulaire d'ajout de l'étudiant
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("MODIFIER UN ETUDIANT"),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
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
              validator: (value) {
                if(value!.length < 3) {
                  return "Entrer un prénom valide";
                }
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: nomC,
              decoration: InputDecoration(
                labelText: "Nom",
                border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
              ),
              validator: (value) {
                if(value!.length < 3) {
                  return "Entrer un nom valide";
                }
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: ageC,
              ///CHANGER LE TYPE DE CLAVER/AJOUTER UN CLAVIER DE CHIFFRE
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
              ),
              validator: (value) {
                if(value!.length < 2) {
                  return "L'age n'est pas valide";
                }
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: noteC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Note",
                border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
              ),
              validator: (value) {
                if(value!.length < 2) {
                  return "La note n'est pas valide";
                }
              },
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
                  if(_formKey.currentState!.validate()) {
                    addStudent(
                        {
                          "nom": nomC.text,
                          "prenom": prenomC.text,
                          "age": ageC.text,
                          "note": noteC.text
                        }).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Etudiant modifié avec succès."), backgroundColor: Colors.pink,)
                      );
                      Navigator.pop(context);
                    });

                  }
                  else {
                    ///AFFICHER UN SNACKBAR/ALERTE
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Tous les champs ne sont pas remplis."), backgroundColor: Colors.pink,)
                    );
                  }
                },
                child: Text("Modifier", style: TextStyle(fontSize: 17),)
            )
          ],
        ),
      ),
    );
  }
}
