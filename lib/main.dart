import 'package:deli_very/pages/codepage.dart';
import 'package:deli_very/pages/loginpage.dart';
import 'package:deli_very/pages/mainscreen.dart';
import 'package:deli_very/pages/registrationpage.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const LoginPage(),
      routes: {
        'login': (context) => const LoginPage(),
        'registration': (context) => const RegistrationPage(),
        'MainScreen': (context) => const MainScreen(),
        'CodePage': (context) => const CodePage(),
      },
    );
  }
}