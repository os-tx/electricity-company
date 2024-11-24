import 'package:flutter/material.dart';

// ignore: must_be_immutable
class detailes3 extends StatefulWidget {
  detailes3(
      {super.key,
      required this.subTitle,
      required this.titel,
      required this.icon1});
  String? subTitle;
  String? titel;
  IconData? icon1;

  @override
  State<detailes3> createState() => _detailes3State();
}

class _detailes3State extends State<detailes3> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("${widget.subTitle}"),
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 223, 8, 8),
            height: 50.0,
            width: w,
          ),
          Center(
            child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 500,
                        width: w,
                        child: Center(child: Icon(widget.icon1)),
                      );
                    },
                  );
                },
                child: Text("${widget.titel}")),
          ),
        ],
      ),
    );
  }
}
