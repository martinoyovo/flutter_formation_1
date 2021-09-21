import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
final ImagePicker image = ImagePicker();

class EditStudent extends StatefulWidget {
  final String documentID;
  const EditStudent({Key? key, required this.documentID}) : super(key: key);

  @override
  _EditStudentState createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  String imageUrl="";
  String nomImage ="";


  @override
  Widget build(BuildContext context) {
    TextEditingController nomC = TextEditingController();
    TextEditingController prenomC = TextEditingController();
    TextEditingController ageC = TextEditingController();
    TextEditingController noteC = TextEditingController();

    ///DEFINE DATABASE COLLECTION
    CollectionReference liste_etudiants = FirebaseFirestore.instance.collection("liste_etudiants");

    Future<void> addStudent(Map<String,dynamic> student) async {
      await liste_etudiants.doc(this.widget.documentID).update(student);
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

            (imageUrl != null)
                ? Image.network(imageUrl)
                : Placeholder(fallbackHeight: 200.0,fallbackWidth: double.infinity),
            SizedBox(height: 20.0,),
            ElevatedButton(
              child: Text('Upload Image'),
              onPressed: () => uploadImage(),
            ),
             

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

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    //Select Image
    final image = await _picker.pickImage(source: ImageSource.gallery);
    var file = File(image!.path);

    if (image != null){
      //Upload to Firebase
      String fileName = basename(image.path);
      var snapshot = await _storage.ref()
          .child('uploads/$fileName')
          .putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
        nomImage = basename(image.path);
      });


      await snapshot.ref.getDownloadURL().then(
            (value) => print("Done: $value"),
      );

    } else {
      print('No Path Received');
    }

  }



}