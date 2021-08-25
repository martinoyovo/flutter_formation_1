import 'package:flutter/material.dart';

Widget textWidgets() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("HELLO", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.amber),),
        RichText(
            text: TextSpan(
          children: [
            TextSpan(text: "Don't have an account? ", style: TextStyle(color: Colors.black)),
            TextSpan(text: "Sign Up", style: TextStyle(color: Colors.amber))
          ]
        ))
      ],
    ),
  );
}