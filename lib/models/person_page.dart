import 'package:flutter/material.dart';

class PersonList extends StatelessWidget {
  const PersonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("liste des étudiants".toUpperCase()),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Card(
            color: Colors.grey.shade300,
            margin: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                Container(
                  height: 85,
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
                      Text("Tino Well", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text("23 ans", style: TextStyle(fontSize: 15),),
                      Row(
                        children: [
                          Icon(Icons.star, color: primaryColor),
                          SizedBox(width: 10,),
                          Text("étoiles"),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
