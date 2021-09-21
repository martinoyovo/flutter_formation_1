import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutteretudiant/firebase_project/edit_student.dart';
import 'package:flutter/material.dart';

///DEFINE DATABASE COLLECTION
 CollectionReference liste_etudiants = FirebaseFirestore.instance.collection("liste_etudiants");

class CustomCard extends StatelessWidget {

  final QueryDocumentSnapshot<Object?> studentInfos;
  const CustomCard({Key? key, required this.studentInfos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => EditStudent(documentID: studentInfos.id))),
     child: Card(
      color: Colors.grey.shade300,
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 8,),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),

      child: Row(
        children: [
          Container(
              height: 114,
              width: 95,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                  //_loadImages(),
              ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(studentInfos["prenom"]+' '+studentInfos["nom"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                SizedBox(height: 3,),
                Text("${studentInfos["age"]} ans", style: TextStyle(fontSize: 15),),
                Row(
                  children: [
                    Icon(Icons.assignment_rounded, color: primaryColor),
                    SizedBox(width: 5,),
                    Text("Note: ${studentInfos["note"]}",),
                    SizedBox(width: MediaQuery.of(context).size.width/8),
                    IconButton(
                        icon: Icon(Icons.delete, color: primaryColor,),
                        onPressed: () => liste_etudiants.doc(studentInfos.id).delete()),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _loadImages() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
        fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });

    return files;
  }
}
