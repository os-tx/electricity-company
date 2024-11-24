import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class detailes2 extends StatefulWidget {
  detailes2(
      {super.key,
      required this.subTitle,
      required this.titel,
      required this.icon1});
  String? subTitle;
  String? titel;
  IconData? icon1;

  @override
  State<detailes2> createState() => _detailes2State();
}

class _detailes2State extends State<detailes2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          // title: Text("${widget.subTitle}"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "${widget.subTitle}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                style: const TextStyle(fontSize: 14),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "مثال: 1234567890",
                  hintStyle: const TextStyle(
                    fontSize: 13,
                    color: Colors.black26,
                  ),
                  filled: true,
                  // border: InputBorder.none,
                  // enabledBorder: InputBorder.none,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.black12,
                        width: 2.0,
                      )),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                ),
              ),
            ),
            Container(
              height: 450,
              width: 370,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'home');
                    },
                    color: const Color.fromARGB(255, 251, 242, 213),
                    textColor: Colors.orange,
                    minWidth: 100,
                    height: 43,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 20,
                        ),
                        SizedBox(width: 7),
                        Text(
                          "التالي",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ),
            ),
          ],
        ));
  }
}
