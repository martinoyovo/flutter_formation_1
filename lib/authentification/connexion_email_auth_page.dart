import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConnexionEmailAuthPage extends StatefulWidget {
  const ConnexionEmailAuthPage({Key? key}) : super(key: key);

  @override
  _ConnexionEmailAuthPageState createState() => _ConnexionEmailAuthPageState();
}

class _ConnexionEmailAuthPageState extends State<ConnexionEmailAuthPage> {
  CollectionReference accountsCollection = FirebaseFirestore.instance.collection("email_accounts");
  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
                  await auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value) {
                    accountsCollection.doc(value.user!.uid).get().then((value) {
                      print(value["lastname"]);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Connexion réussie: "+ value["lastname"]))
                      );
                    });
                  }).catchError((e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Erreur lors de la création du compte: $e"))
                    );
                  });
                  }, child: Text("Se connecter"))
          ],
        ),
      ),
    );
  }
}
