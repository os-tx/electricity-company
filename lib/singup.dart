import 'package:flutter/material.dart';

class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  bool secure = true;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var idnumberController = TextEditingController();
  var formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Form(
            key: formstate,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: Image.asset('images/e-5.png'),
                  ),
                  const SizedBox(
                    height: 50,
                    child: Text(
                      "- انشاء حساب جديد -",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        height: 2,
                      ),
                    ),
                  ),
                  // username
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "برجى ادخال الاسم";
                      } else if (!RegExp(r'^[a-z-A-Z-ا-ي]+$').hasMatch(value)) {
                        return "يرجى ادخال الاسم صحيح ";
                      } else {
                        return null;
                      }
                    },
                    controller: nameController,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                      ),
                      labelText: 'الاسم',
                      labelStyle: const TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                      ),
                      suffixIcon: const Icon(
                        Icons.person,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black54,
                          width: 3,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // email
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "يرجى ادخال البريد الالكنروني";
                      } else if (!value.endsWith('.com') ||
                          !value.contains('@gmail')) {
                        return "ارجوك ادخل ايميل صحيح";
                      }

                      return null;
                    },
                    controller: emailController,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      suffixStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                      ),
                      labelText: 'البريد الالكتروني',
                      labelStyle: const TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                      ),
                      suffixIcon: const Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.black54,
                            width: 3,
                          )),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // password
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "يرجى ادخال كلمة السر";
                      } else {
                        return null;
                      }
                    },
                    controller: passwordController,
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
                        color: Colors.black54,
                      ),
                      suffixIcon: const Icon(
                        Icons.password,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black54,
                          width: 3,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: secure,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // phone
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "يرجى ادخال رقم الجوال";
                      } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return "يرجى ادخال رقم جوال صحيح";
                      }
                      return null;
                    },
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      suffixStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                      ),
                      labelText: 'رقم الجوال',
                      labelStyle: const TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                      ),
                      suffixIcon: const Icon(
                        Icons.phone,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black54,
                          width: 3,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // ID number
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "يرجى ادخال رقم الهوية";
                      } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return "يرجى ادخال رقم هوية صحيح";
                      } else if (value.length != 11) {
                        return "يرجى ادخال 11 رقم لهوية صحيحة";
                      }

                      return null;
                    },
                    controller: idnumberController,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      suffixStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                      ),
                      labelText: 'رقم الهويه',
                      labelStyle: const TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                      ),
                      suffixIcon: const Icon(
                        Icons.numbers,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black45,
                          width: 3,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  MaterialButton(
                      onPressed: () {
                        setState(() {
                          if (formstate.currentState!.validate()) {
                            Navigator.pushNamed(context, 'login', arguments: {
                              'name': nameController.text,
                              'email': emailController.text,
                              'passwored': passwordController.value,
                              'idnumber': idnumberController.value,
                            });
                          }
                        });
                      },
                      color: Colors.orangeAccent,
                      textColor: Colors.white,
                      minWidth: 300,
                      height: 45,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: const Text(
                        "انشاء حساب",
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
