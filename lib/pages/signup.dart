import 'package:flutter/material.dart';
import 'package:loginpage/controllers/controller.dart';
import 'package:loginpage/pages/home.dart';
import 'package:loginpage/pages/login.dart';
import 'package:loginpage/services/auth.dart';
import 'package:loginpage/widgets/login_field.dart';
import 'package:loginpage/widgets/social_button.dart';

import '../widgets/gradientButton.dart';

class Signup extends StatefulWidget {
  Signup({super.key});
  bool showloading = false;
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  void dispose() {
    Controller.usernamecontroller.dispose();
    Controller.passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Center(child: Image.asset('assets/images/signin_balls.png')),
          const Center(
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Color.fromARGB(255, 233, 108, 255),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const SocialButton(
              iconPath: 'assets/svgs/g_logo.svg', label: "Google"),
          const SocialButton(
            iconPath: 'assets/svgs/f_logo.svg',
            label: "Facebook",
            horizontalPadding: 90,
          ),
          const SizedBox(
            height: 5,
          ),
          const Center(
            child: Text(
              "or",
              style: TextStyle(fontSize: 20, color: Colors.white60),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          LoginField(
            textEditingController: Controller.usernamecontroller,
            hint: "Username",
          ),
          const SizedBox(
            height: 10,
          ),
          LoginField(
            textEditingController: Controller.passwordcontroller,
            hint: "Password",
          ),
          const SizedBox(
            height: 10,
          ),
          Gradient_Button(
            button: () async {
              if (Controller.usernamecontroller.text.isEmpty ||
                  Controller.passwordcontroller.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Enter required details")));
              } else {
                setState(() {
                  widget.showloading = true;
                });
                await AuthServices().registerUser(
                    Controller.usernamecontroller.text,
                    Controller.passwordcontroller.text,
                    context);
                setState(() {
                  widget.showloading = false;
                });
              }
            },
            label: "Sign Up",
            showloading: widget.showloading,
          ),
          const SizedBox(
            height: 10,
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  Controller.usernamecontroller.clear();
                  Controller.passwordcontroller.clear();
                  return const Loginscreen();
                },
              ));
            },
            elevation: 0,
            fillColor: Colors.grey[850],
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 25.0,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          )
        ],
      ),
    ));
  }
}
