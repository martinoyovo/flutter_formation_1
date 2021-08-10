import 'package:flutter/material.dart';

class VisitCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff052555),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,

          ///CENTRER LE APP BAR
          centerTitle: true,
          title: Text("Ma carte de visite"),
        ),
        body: Center(
          ///PAS OBLIGE DE METTRE LE PADDING
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 70.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/honore.png'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    ///APPLIQUER BORDER RADIUS AU WIDGET CARD
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Honoré",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(
                      top: 30.0,
                      bottom: 15.0,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Je suis développeur d'application mobile Flutter. Mon numéro de téléphone est: 91650680",
                        style: TextStyle(fontSize: 13),
                        ///PERMET DE JUSTIFIER LE TEXT
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
