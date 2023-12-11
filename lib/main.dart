import 'package:deli_very/pages/codepage.dart';
import 'package:deli_very/pages/loginpage.dart';
import 'package:deli_very/pages/mainscreen.dart';
import 'package:deli_very/pages/passwordpage.dart';
import 'package:deli_very/pages/registrationpage.dart';
import 'package:deli_very/pages/regobject.dart';
import 'package:deli_very/widgets/map.dart';
import 'package:deli_very/widgets/menu.dart';
import 'package:deli_very/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/addorder.dart';
import 'widgets/order.dart';

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
      theme: ThemeData(
        textTheme: GoogleFonts.montserratAlternatesTextTheme(Theme.of(context).textTheme),
      ),
        home: const Splash(),
      routes: {
        'login': (context) => const LoginPage(),
        'registration': (context) => const RegistrationPage(),
        'MainScreen': (context) => const MainScreen(),
        'CodePage': (context) => const CodePage(),
        'PasswordPage': (context) => const PasswordPage(),
        'RegObject': (context) => const RegObject(),
        'OrderPage': (context) => const OrderPage(),
        'MenuPage': (context) => const MenuPage(),
        'MapPage': (context) => const MapPage(),
        'AddOrder': (context) => const AddOrder(),
      },
    );
  }
}