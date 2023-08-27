import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/controllers/controller.dart';
import 'package:loginpage/pages/home.dart';
import 'package:loginpage/pages/signup.dart';
import 'package:loginpage/widgets/gradientButton.dart';
import 'package:loginpage/widgets/login_field.dart';
import 'package:loginpage/widgets/social_button.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Loginscreen> {
  bool showloading = false;
  @override
  void dispose() {
    Controller.usernamecontroller.dispose();
    Controller.passwordcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Image.asset('assets/images/signin_balls.png')),
            const Center(
              child: Text(
                'Sign In/Up',
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
              button: () {
                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: Controller.usernamecontroller.text,
                    password: Controller.passwordcontroller.text);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return Home(name: Controller.usernamecontroller.text);
                  },
                ));
              },
              label: "Log In",
              showloading: showloading,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          Controller.usernamecontroller.clear();
                          Controller.passwordcontroller.clear();
                          return Signup();
                        },
                      ));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
