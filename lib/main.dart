import 'package:electricity_company/defin.dart';
import 'package:electricity_company/home.dart';
import 'package:electricity_company/login.dart';
import 'package:electricity_company/singup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Elec());
}

class Elec extends StatefulWidget {
  const Elec({super.key});

  @override
  State<Elec> createState() => _ElecState();
}

class _ElecState extends State<Elec> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'defin',
      routes: {
        'defin': (context) => const Defin(),
        'login': (context) => const Login(),
        'home': (context) => const Home(),
        'singup': (context) => const Singup(),
      },
      home: const Defin(),
    );
  }
}
