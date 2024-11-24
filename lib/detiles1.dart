import 'package:flutter/material.dart';

// ignore: must_be_immutable
class detailes1 extends StatefulWidget {
  detailes1({super.key, this.subTitle, this.titel, this.icon1});
  String? subTitle;
  String? titel;
  IconData? icon1;

  @override
  State<detailes1> createState() => _detailes1State();
}

class _detailes1State extends State<detailes1> {
  TextEditingController cntroler_report = new TextEditingController();
  List element = [
    "بلاغ",
    "بلاغ",
    "بلاغ",
  ];
  List filter = [];
  String query = "";

  void additem(String item) {
    setState(() {
      filter.add(item);
    });
  }

  void initState() {
    super.initState();
    filter = element;
  }

  update(String newquyry) {
    setState(() {});
    print(newquyry);
    query = newquyry;
    filter = element
        .where((t) => t.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  var namectr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.sizeOf(context).width;
    var h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "بلاغ",
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          Icons.report,
          color: Colors.white,
        ),
        backgroundColor: Colors.orange,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            builder: (context) {
              return Container(
                  height: 300,
                  width: w,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: TextField(
                            controller: cntroler_report,
                            textAlign: TextAlign.right,
                            decoration: const InputDecoration(
                                labelText: "اضافة بلاغ",
                                suffixIcon: Icon(
                                  Icons.add_box_outlined,
                                )),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.orange,
                          textColor: Colors.white,
                          minWidth: 300,
                          height: 40,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            setState(() {});
                            element.add(cntroler_report.text);
                            Navigator.of(context).pop();
                            // Navigator.pushNamed(context, 'detil-1');
                          },
                          child: const Text("اضافه"),
                        )
                      ],
                    ),
                  ));
            },
          );
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("${widget.subTitle}"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: namectr,
                      onChanged: update,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        labelText: "بحث",
                        labelStyle: TextStyle(fontSize: 20),
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: filter.length,
                    itemBuilder: (context, i) {
                      return Card(
                        color: Colors.orange,
                        shadowColor: Colors.black,
                        elevation: 10,
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                filter[i],
                                style: const TextStyle(color: Colors.white),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showDialog(
                                            // ---------
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title:
                                                    Text("are you sure---->?"),
                                                actions: [
                                                  InkWell(
                                                    onTap: () {
                                                      element.removeAt(i);
                                                    },
                                                    child: Text("نعم"),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("لا"),
                                                  )
                                                ],
                                              );
                                            },
                                          );
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete_forever_outlined,
                                        color: Colors.white,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              )
            ],
            // ),
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //     // height: h,
            //     child: Align(
            //       alignment: Alignment.bottomRight,
            //       child: Container(
            //         alignment: Alignment.center,
            //         height: 50,
            //         width: 100,
            //         decoration: BoxDecoration(
            //             color: const Color.fromARGB(255, 228, 204, 239),
            //             borderRadius: BorderRadius.circular(15)),
            //         child: const Text(
            //           "اضافة بلاغ",
            //           style: TextStyle(
            //               fontSize: 15,
            //               color: Colors.purple,
            //               fontWeight: FontWeight.bold),
            //           textAlign: TextAlign.center,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          )
        ],
      ),
    );
  }
}
