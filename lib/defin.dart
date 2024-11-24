import 'package:flutter/material.dart';

class Defin extends StatefulWidget {
  const Defin({super.key});

  @override
  State<Defin> createState() => _DefinState();
}

class _DefinState extends State<Defin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 400,
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              "images/e-2.jpg",
              alignment: Alignment.center,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Column(
                children: [
                  const Text(
                    "! من نحن",
                    style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "تطبيق يسهل عليك متابعة كهرباء منزلك, من متابعة استهلاك الكهرباء والابلاغ عن اي اعطال او مشاكل في الكهرباء وسداد ومتابعة فواتير الكهرباء",
                    style: TextStyle(fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CircleAvatar(
                    maxRadius: 35,
                    backgroundColor: const Color.fromARGB(255, 137, 59, 197),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pushNamed(context, 'login');
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 33,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "تخطي",
                    style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
