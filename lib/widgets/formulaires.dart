import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Formulaire extends StatelessWidget {
  bool isObscurePasseword = true;

  ///CONTROLER UN FORMULAIRE
  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          children: [
            SizedBox(height: 30),
            buildTextField(labelText: "Full Name", placeholder: "BABA GOD",),
            buildTextField(labelText: "Email", placeholder: "babagod@gmail.com"),
            buildTextField(labelText: "Password", placeholder: "**********", isPasswordTextField: true),
            buildTextField(labelText: "Location", placeholder: "CANADA"),
            buildTextField(labelText: "Full Name", placeholder: "BABA GOD",),
            SizedBox(height: 30),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text("Cancel",
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2,
                      color: Colors.black
                    )),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.validate();
                      },
                      child: Text("SAVE",
                        style: TextStyle(fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white,
                        )),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  )
                ],
            )
          ],
        ),
      ),
    );
  }
  Widget buildTextField(
      {String? labelText,
      String? placeholder,
      bool? isPasswordTextField,
      String? customValidator}){
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextFormField(
        //obscureText: isPasswordTextField !=null ? isObscurePasseword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField == true ?
              IconButton(
                icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                onPressed: () {},
              ): null,
              contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(),
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          )
        ),
        validator:(v) {
          if(v!.isEmpty) {
            return "Ce champs est vide.";
          } else if(v.length < 3) {
            return "Ce champs est invalide.";
          }
        }
      ),
    );

  }
}
