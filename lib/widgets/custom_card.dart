import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class CustomCard extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> studentInfos;
  const CustomCard({Key? key, required this.studentInfos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Card(
      color: Colors.grey.shade300,
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 8,),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Container(
              height: 88,
              width: 80,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(10))
              )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(studentInfos["prenom"]+studentInfos["nom"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 3,),
                Text("${studentInfos["age"]} ans", style: TextStyle(fontSize: 15),),
                Row(
                  children: [
                    Icon(Icons.assignment_rounded, color: primaryColor),
                    SizedBox(width: 5,),
                    Text("Note: ${studentInfos["note"]}"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
