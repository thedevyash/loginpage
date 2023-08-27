import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/controllers/controller.dart';
import 'package:loginpage/pages/login.dart';

class Home extends StatefulWidget {
  Home({super.key, this.name});
  final String? name;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "Welcome ${widget.name}",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            RawMaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Controller.usernamecontroller.clear();
                  Controller.passwordcontroller.clear();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Loginscreen()));
                });
              },
              child: Icon(Icons.arrow_back),
            )
          ]),
        ),
      ),
    );
  }
}
