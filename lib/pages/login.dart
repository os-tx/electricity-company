import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool secure = true;
  var nameoridnumCont = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map?;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.orangeAccent),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "مرحباً بك",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(255, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: Column(
                            children: [
                              Form(
                                key: formstate,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 204, 204, 204)),
                                        ),
                                      ),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "يرجى ادخال اسم المستخدم او رقم الهوية";
                                          } else if (!RegExp(
                                                  r'^[- 0-9-a-z-A-Z-ا-ي]+$')
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
                                        textAlign: TextAlign.right,
                                        decoration: const InputDecoration(
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          hintText:
                                              "اسم المستخدم او رقم الهوية",
                                          prefixIcon: Icon(
                                            Icons.person,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "يرجى ادخال كلمة السر";
                                          } else if (value !=
                                              args?['passwored']) {
                                            return "يرجى التأكد من كلمة السر";
                                          }
                                          return null;
                                        },
                                        textAlign: TextAlign.right,
                                        decoration: InputDecoration(
                                            hintStyle: const TextStyle(
                                              color: Colors.grey,
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  secure = !secure;
                                                });
                                              },
                                              icon: const Icon(
                                                  Icons.visibility_off),
                                            ),
                                            hintText: 'كلمة السر',
                                            prefixIcon: const Icon(
                                              Icons.password,
                                            ),
                                            border: InputBorder.none),
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText: secure,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "هل نسيت كلمة السر؟",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
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
                          minWidth: 200,
                          height: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: const Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "هل لديك حساب؟؟",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'singup');
                              },
                              child: const Text(
                                "انشاء حساب",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
