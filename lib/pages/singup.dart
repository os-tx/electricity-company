import 'package:flutter/material.dart';

class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  bool secure = true;
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var idnumberController = TextEditingController();
  var formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.orangeAccent),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset('images/e-5.png'),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "- انشاء حساب جديد -",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
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
                          Form(
                            key: formstate,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "برجى ادخال الاسم";
                                    } else if (!RegExp(r'^[- a-z-A-Z-ا-ي]+$')
                                        .hasMatch(value)) {
                                      return "يرجى ادخال الاسم صحيح ";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: nameController,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                    hintText: 'الاسم الرباعي',
                                    prefixIcon: const Icon(
                                      Icons.person,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
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
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          secure = !secure;
                                        });
                                      },
                                      icon: const Icon(Icons.visibility_off),
                                    ),
                                    hintText: 'كلمة السر',
                                    prefixIcon: const Icon(
                                      Icons.password,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: secure,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "يرجى ادخال رقم الجوال";
                                    } else if (!RegExp(r'^[0-9]+$')
                                        .hasMatch(value)) {
                                      return "يرجى ادخال رقم جوال صحيح";
                                    } else if (value.length != 9) {
                                      return "يرجى ادخال 9 أرقم لرقم جوال صحيح";
                                    }
                                    return null;
                                  },
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                    hintText: 'رقم الجوال',
                                    prefixIcon: const Icon(
                                      Icons.phone,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.phone,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "يرجى ادخال رقم الهوية";
                                    } else if (!RegExp(r'^[0-9]+$')
                                        .hasMatch(value)) {
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
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                    hintText: 'رقم الهويه',
                                    prefixIcon: const Icon(
                                      Icons.credit_card,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      if (formstate.currentState!.validate()) {
                                        Navigator.pushReplacementNamed(
                                            context, 'login',
                                            arguments: {
                                              'name': nameController.text,
                                              'passwored':
                                                  passwordController.text,
                                              'idnumber':
                                                  idnumberController.text,
                                            });
                                      }
                                    });
                                  },
                                  color: Colors.orangeAccent,
                                  textColor: Colors.white,
                                  minWidth: 300,
                                  height: 45,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Text(
                                    "انشاء حساب",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
