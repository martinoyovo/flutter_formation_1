import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
     children: <Widget>[
       Expanded(
         flex: 1,

           child: Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget> [
             Expanded(
                 child: Container(
                   child: Text("MENU 1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                 )
             ),
             Expanded(
                 child: Container(
                   child: Text("MENU 2", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                 )
             ),
             Expanded(
                 child: Container(
                   child: Text("MENU 3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                 )
             ),
           ],

       )),
       Expanded(
           flex: 4,
           child: Row(
             children: <Widget>[
               Expanded(
                   flex: 5,
                 child: Container(
                   color: Colors.deepOrange,
                   alignment: Alignment.center,
                   child: Text("PRODUIT", style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),),
                 ),
               ),
               Expanded(
                 flex: 5,
                 child: Column(
                   children: <Widget> [
                     Expanded(
                       flex: 2,
                         child: Container(
                           color: Colors.pinkAccent,
                           alignment: Alignment.center,
                           child: Text("PRIX", style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),),
                         )
                     ),
                     Expanded(
                         flex: 8,
                         child: Container(
                           color: Colors.deepPurple,
                           alignment: Alignment.center,
                           child: Text("DESCRIPTION", style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),),
                         )
                     )
                   ],
                 ),
               )
             ],

           )),
       Expanded(
           flex: 2,
           child: Container(
             color: Colors.deepOrangeAccent,
             alignment: Alignment.center,
             child: Text("AUTRES INFORMATIONS", style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),),

           )),
     ],
    );
  }
}
