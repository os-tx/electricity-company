import 'package:electricity_company/pages/defin.dart';
import 'package:electricity_company/pages/home.dart';
import 'package:electricity_company/pages/login.dart';
import 'package:electricity_company/pages/singup.dart';
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
      theme: ThemeData(fontFamily: 'Cairo'),
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'defin': (context) => const Defin(),
        'login': (context) => const Login(),
        'home': (context) => const Home(),
        'singup': (context) => const Singup(),
      },
      home: const Defin(),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}
