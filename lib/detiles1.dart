import 'package:flutter/material.dart';

// ignore: must_be_immutable
class detailes1 extends StatefulWidget {
  detailes1({super.key, this.subTitle});
  String? subTitle;

  @override
  State<detailes1> createState() => _detailes1State();
}

class _detailes1State extends State<detailes1> {
  TextEditingController cntroler_report = new TextEditingController();
  List element = [
    "انقطاع الكهرباء في منطقة فوه الانشاءات",
    "ضعف الكهرباء في منطقة خلف",
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
    // print(newquyry);
    query = newquyry;
    filter = element
        .where((t) => t.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  var namectr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.sizeOf(context).width;
    // var a = ModalRoute.of(context)!.settings.arguments as Map?;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          "اضافة بلاغ",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        icon: const Icon(
          Icons.report,
          color: Colors.white,
        ),
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            builder: (context) {
              return Container(
                height: 400,
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
                          cntroler_report.clear();
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "اضافه",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          "${widget.subTitle}",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        labelText: "بحث",
                        labelStyle: TextStyle(fontSize: 20),
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    child: const Divider(
                      thickness: 1,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: filter.length,
                    itemBuilder: (context, i) {
                      return Card(
                        color: Colors.white,
                        shadowColor: Colors.orangeAccent,
                        elevation: 10,
                        child: ListTile(
                          title: Text(
                            filter[i],
                            style: const TextStyle(color: Colors.black),
                          ),
                          // subtitle: Text("${a?['nameoridnum']}"),
                          leading: const Icon(Icons.person),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content:
                                          const Text("هل انت متاكد من الحذف؟"),
                                      icon: const Icon(
                                        Icons.warning_rounded,
                                        color: Colors.red,
                                      ),
                                      title: const Text("حذف؟؟"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {});
                                            Navigator.pop(context);
                                            element.removeAt(i);
                                          },
                                          child: const Text("نعم"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          child: const Text("لا"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                            },
                            icon: const Icon(
                              Icons.delete_forever_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
