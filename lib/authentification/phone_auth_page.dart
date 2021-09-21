import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  CollectionReference nbers = FirebaseFirestore.instance.collection("numeros");
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _smsCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentification par numéro de téléphone"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: "Numéro de téléphone"
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await auth.verifyPhoneNumber(
                  phoneNumber: _phoneController.text,
                  verificationCompleted: (PhoneAuthCredential credential) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Numéro de téléphone vérifié avec succès"))
                    );
                  },
                  verificationFailed: (FirebaseAuthException e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Erreur de vérification : $e"))
                    );
                  },
                  codeSent: (String? verificationId, int? resendToken) {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: Text("Saisir le code reçu par SMS"),
                        content: TextField(
                          controller: _smsCodeController,
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                PhoneAuthProvider.credential(verificationId: verificationId!, smsCode: _smsCodeController.text);
                                nbers.add({
                                  "uid": auth.currentUser!.uid,
                                  "telephone" : _phoneController.text
                                });
                              },
                              child: Text("Vérifier le code")
                          )
                        ],
                      );
                    });
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {

                  }
              );
            },
              child: Text("Vérifier"))
        ],
      ),
    );
  }
}
