import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InscriptionEmailAuthPage extends StatefulWidget {
  const InscriptionEmailAuthPage({Key? key}) : super(key: key);

  @override
  _InscriptionEmailAuthPageState createState() => _InscriptionEmailAuthPageState();
}

class _InscriptionEmailAuthPageState extends State<InscriptionEmailAuthPage> {
  CollectionReference accountsCollection = FirebaseFirestore.instance.collection("email_accounts");
  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentification par email"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _firstnameController,
              decoration: InputDecoration(
                labelText: "Prénoms"
              ),
            ),
            TextFormField(
              controller: _lastnameController,
              decoration: InputDecoration(
                labelText: "Nom"
              ),
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email"
              ),
            ),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "Mot de passe"
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  //signInWithEmailAndPassword(email: email, password: password)
                  await auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value) {
                    print(value);
                    accountsCollection.doc(value.user!.uid).set({
                      "uid": value.user!.uid,
                      "firstname": _firstnameController.text,
                      "lastname": _lastnameController.text,
                      "password": _passwordController.text,
                      "email":  _emailController.text
                    }).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Inscription réussie"))
                      );
                    });
                  }).catchError((e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Erreur lors de la création du compte: $e"))
                    );
                  });
                  }, child: Text("S'inscrire"))
          ],
        ),
      ),
    );
  }
}
