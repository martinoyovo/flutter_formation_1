import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exo2Corrections extends StatelessWidget {
  final menuTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        //borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                        /*image: DecorationImage(
                          image: AssetImage("assets/avatar.jpg"),
                          fit: BoxFit.contain
                        )*/
                      ),
                    ),
                    Image.asset("assets/avatar.jpg", width: 150, height: 150, fit: BoxFit.contain,),
                  ],
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget> [
                    Text("MENU 1", style: menuTextStyle),
                    Text("MENU 2", style: menuTextStyle),
                    Text("MENU 3", style: menuTextStyle),
                  ],

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
                    //crossAxisAlignment: CrossAxisAlignment.center,
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
