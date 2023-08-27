import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/models/palette.dart';
import 'package:loginpage/pages/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAQpAjy_Ib5sp3-9bSdZzvGP_IDUyKcuXE", // Your apiKey
      appId: "1:921599693086:android:29242830f3429cfda3790f", // Your appId
// Your messagingSenderId
      projectId: "logindemo-43234",
      messagingSenderId: 'jhvjhvhjfvhv', // Your projectId
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: Pallete.backgroundColor),
      home: const Loginscreen(),
    );
  }
}
