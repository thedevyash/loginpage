import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpage/controllers/controller.dart';
import 'package:loginpage/pages/home.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  registerUser(email, password, context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Registered Successfully")));
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Home(
            name: Controller.usernamecontroller.text,
          );
        }));
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
