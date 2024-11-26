import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool secure = true;
  var nameoridnumCont = TextEditingController();
  var formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map?;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  "images/e-3.jpg",
                  alignment: Alignment.center,
                ),
              ),
              Container(
                width: 350,
                height: 80,
                child: const Text(
                  "سجل دخولك",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
              Container(
                child: Form(
                  key: formstate,
                  child: Column(
                    children: [
                      // username
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "يرجى ادخال اسم المستخدم او رقم الهوية";
                          } else if (!RegExp(r'^[- 0-9-a-z-A-Z-ا-ي]+$')
                              .hasMatch(value)) {
                            return "يرجى ادخال اسم صحيح ";
                          } else if (value != args?['name'] &&
                              value != args?['idnumber']) {
                            return "يرجى التأكد من اسم المستخدم او رقم الهوية";
                          } else {
                            return null;
                          }
                        },
                        controller: nameoridnumCont,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black45,
                          ),
                          labelText: "اسم المستخدم او رقم الهوية",
                          labelStyle: const TextStyle(
                            fontSize: 17,
                            color: Colors.black45,
                          ),
                          suffixIcon: const Icon(
                            Icons.person,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                              width: 3,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // password
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "يرجى ادخال كلمة السر";
                          } else if (value != args?['passwored']) {
                            return "يرجى التأكد من كلمة السر";
                          }
                          return null;
                        },
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black45,
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                secure = !secure;
                              });
                            },
                            icon: const Icon(Icons.visibility_off),
                          ),
                          labelText: 'كلمة السر',
                          labelStyle: const TextStyle(
                            fontSize: 17,
                            color: Colors.black45,
                          ),
                          suffixIcon: const Icon(
                            Icons.password,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                              width: 3,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: secure,
                      ),
                      const SizedBox(height: 8),
                      Container(
                          width: 350,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "هل نسيت كلمة السر؟",
                                style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.3),
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 70,
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (formstate.currentState!.validate()) {
                            Navigator.pushReplacementNamed(context, 'home',
                                arguments: {
                                  'nameoridnum': nameoridnumCont.text
                                });
                          }
                        },
                        color: Colors.orangeAccent,
                        textColor: Colors.white,
                        minWidth: 300,
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: const Text(
                          "سجل دخولك",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(context, 'singup');
                          });
                        },
                        color: const Color.fromARGB(255, 251, 234, 213),
                        textColor: Colors.orangeAccent,
                        minWidth: 300,
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: const Text(
                          "مستخدم جديد؟",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
