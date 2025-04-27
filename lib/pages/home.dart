import 'package:electricity_company/pages/detiles1.dart';
import 'package:electricity_company/pages/detiles2.dart';
import 'package:electricity_company/pages/detiles3.dart';
// import 'package:electricity_company/pages/detiles4.dart';
// import 'package:electricity_company/pages/detiles5.dart';
// import 'package:electricity_company/pages/detiles6.dart';
import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

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
    "الدعم الفني",
    "خدمات لسلامتك",
    "سدد فواتيرك",
    "اطلب عداد كهرباء منزلك",
  ];
  List<String> titles = [
    'الخدمات الإلكترونية',
    'تغيير بيانات',
    'خدمات العدادات',
    'الحصول على شهادة بيانات',
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
  bool isHighlighted = false;
  int seledIndexcard = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "الخدمات",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                  height: 260,
                  child: AnotherCarousel(
                    images: const [
                      AssetImage("images/e-4.jpeg"),
                      AssetImage("images/e-7.jpg"),
                      AssetImage("images/e-8.jpg"),
                    ],
                    dotSize: 5,
                    indicatorBgPadding: 5.0,
                  ),
                ),
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
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listicon.length,
                // reverse: false,
                itemBuilder: (context, i) {
                  bool isHighlighted = i == seledIndexcard;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        seledIndexcard = i;
                      });
                    },
                    child: Container(
                      width: 110,
                      margin: const EdgeInsets.all(5),
                      child: Card(
                        color:
                            isHighlighted ? Colors.orangeAccent : Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                listicon[i],
                                size: 40,
                                color:
                                    isHighlighted ? Colors.white : Colors.black,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                titles[i],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isHighlighted
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 30,
              margin: const EdgeInsets.only(right: 20, top: 15),
              child: const Text(
                "الخدمات الالكترونية",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listTitle.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.1,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, i) => carditem(
                  Title: listTitle[i],
                  SubTitle: listsubtile[i],
                  Icon1: listicon[i],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الخدمات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'طلباتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'المزيد',
          ),
        ],
      ),
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
                      ),
                    ));
              }
              break;
            // case "خدمات اخرى":
            //   {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => detailes4(
            //             subTitle: SubTitle,
            //             titel: Title,
            //             icon1: Icon1,
            //           ),
            //         ));
            //   }
            //   break;
            // case "تسديد فواتبر":
            //   {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => detailes5(
            //             subTitle: SubTitle,
            //             titel: Title,
            //             icon1: Icon1,
            //           ),
            //         ));
            //   }
            //   break;
            // case "طلب عداد كهرباء":
            //   {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => detailes6(
            //             subTitle: SubTitle,
            //             titel: Title,
            //             icon1: Icon1,
            //           ),
            //         ));
            //   }
            //   break;
          }
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.orangeAccent),
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
                      const Spacer(),
                      Expanded(
                        child: Text(
                          textDirection: TextDirection.rtl,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          "$Title",
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
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
                        "$SubTitle",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
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
