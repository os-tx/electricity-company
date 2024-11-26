import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class detailes2 extends StatefulWidget {
  detailes2({
    super.key,
    required this.subTitle,
    required this.icon1,
  });
  String? subTitle;
  IconData? icon1;

  @override
  State<detailes2> createState() => _detailes2State();
}

class _detailes2State extends State<detailes2> {
  TextEditingController bills_controller = TextEditingController();
  List bills = ['12345', '23456', '34567', '45678', '12345', '12345', '45678'];
  List filterbills = [];

  void _filterbills(String q) {
    final filter = bills.where((bill) => bill.contains(q)).toList();
    setState(() {
      filterbills = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "${widget.subTitle}",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "أدخل رقم الاشتراك",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            TextField(
              controller: bills_controller,
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
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.purple[900],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Colors.black12,
                    width: 2.0,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              ),
            ),
            MaterialButton(
              onPressed: () {
                _filterbills(bills_controller.text);
              },
              color: Colors.orangeAccent,
              textColor: Colors.white,
              minWidth: 300,
              height: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: const Text(
                "استعلام",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: filterbills.length,
              itemBuilder: (context, i) {
                return Card(
                  color: Colors.white,
                  shadowColor: Colors.orange,
                  elevation: 5,
                  child: ListTile(
                    title: Column(
                      children: [
                        const Text("المبلغ المطلوب"),
                        const Text(
                          "15.354",
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        ),
                        const Text("رقم المشترك"),
                        Text(
                          filterbills[i],
                          style: const TextStyle(
                              color: Colors.orangeAccent, fontSize: 14),
                        )
                      ],
                    ),
                    leading: Icon(
                      widget.icon1,
                      color: Colors.orangeAccent,
                    ),
                    trailing: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "فاتورة شهر: 2024/10",
                          style: TextStyle(
                              fontSize: 12, color: Colors.orangeAccent),
                        ),
                        Text(
                          "تاريخ التسديد: 2024/10/12",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "كمية الاستهلاك: 244 ك.و",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
