import 'package:electricity_company/detiles1.dart';
import 'package:electricity_company/detiles2.dart';
import 'package:electricity_company/detiles3.dart';
import 'package:electricity_company/detiles4.dart';
import 'package:electricity_company/detiles5.dart';
import 'package:electricity_company/detiles6.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List listTitle = [
    "البلاغات",
    "الفواتير",
    "المحادثة المباشرة",
    "خدمات اخرى",
    "تسديد فواتبر",
    "طلب عداد كهرباء",
  ];
  List listsubtile = [
    "الابلاغ عن انقطاع الكهرباء",
    "استعراض الفواتير ومتابعتها",
    "للاستفسارات والشكاوي",
    "خدمات لسلامتك",
    "سدد فواتيرك",
    "اطلب عداد كهرباء منزلك",
  ];
  List listicon = [
    Icons.electric_bolt_sharp,
    Icons.library_books,
    Icons.chat_outlined,
    Icons.assignment_late_outlined,
    Icons.payment,
    Icons.electric_meter,
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                    height: 370,
                    child: Image.asset(
                      fit: BoxFit.cover,
                      "images/e-4.jpeg",
                    )),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 360,
                  child: const Text(
                    "نقدم الطاقة الكهربائية عبر منظومة متكاملة بموثوقية عالية",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(right: 25),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "خدماتي",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      textAlign: TextAlign.right,
                      "خدماتك في مكان واحد",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              flex: 8,
              child: GridView.builder(
                  itemCount: listTitle.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      crossAxisCount: 2),
                  itemBuilder: (context, i) => carditem(
                        Title: listTitle[i],
                        SubTitle: listsubtile[i],
                        Icon1: listicon[i],
                      ))),
          // Divider()
        ],
      ),
      bottomNavigationBar: NavigationBar(
          indicatorColor: const Color.fromARGB(255, 247, 198, 146),
          surfaceTintColor: Colors.amber,
          backgroundColor: const Color.fromARGB(255, 249, 248, 248),
          selectedIndex: index,
          height: 60,
          onDestinationSelected: (value) {
            index = value;
            setState(() {});
          },
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.person,
                  color: Colors.orange,
                ),
                label: "الملف الشخصي"),
            NavigationDestination(
                icon: Icon(
                  Icons.app_registration_sharp,
                  color: Colors.orange,
                ),
                label: "الخدمات")
          ]),
    );
  }
}

// ignore: camel_case_types
class carditem extends StatelessWidget {
  const carditem({
    this.Title,
    this.SubTitle,
    this.Icon1,
    super.key,
  });
  final String? Title;
  final String? SubTitle;
  final IconData? Icon1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          switch (Title) {
            case "البلاغات":
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailes1(
                        subTitle: SubTitle,
                        titel: Title,
                        icon1: Icon1,
                      ),
                    ));
              }
              break;
            case "الفواتير":
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailes2(
                        subTitle: SubTitle,
                        titel: Title,
                        icon1: Icon1,
                      ),
                    ));
              }
              break;
            case "المحادثة المباشرة":
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailes3(
                        subTitle: SubTitle,
                        titel: Title,
                        icon1: Icon1,
                      ),
                    ));
              }
              break;
            case "خدمات اخرى":
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailes4(
                        subTitle: SubTitle,
                        titel: Title,
                        icon1: Icon1,
                      ),
                    ));
              }
              break;
            case "تسديد فواتبر":
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailes5(
                        subTitle: SubTitle,
                        titel: Title,
                        icon1: Icon1,
                      ),
                    ));
              }
              break;
            case "طلب عداد كهرباء":
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailes6(
                        subTitle: SubTitle,
                        titel: Title,
                        icon1: Icon1,
                      ),
                    ));
              }
              break;
          }
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          width: 50,
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 248, 230, 203),
                        child: Icon(
                          Icon1,
                          color: const Color.fromARGB(255, 227, 136, 0),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: Text(
                          textDirection: TextDirection.rtl,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          "${Title}",
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                        "${SubTitle}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
