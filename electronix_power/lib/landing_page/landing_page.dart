import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:electronix_power/Color/color.dart';
import 'package:electronix_power/home_page/home_page.dart';
import 'package:electronix_power/login_register/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class landing_page extends StatefulWidget {
  const landing_page({super.key});

  @override
  State<landing_page> createState() => _landing_pageState();
}

class _landing_pageState extends State<landing_page> {
  int pageIndex = 0;

  List<Widget> _demo = [
    Container(
      height: 300,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 50),
            child: Row(
              children: [
                Container(
                  height: 140,
                  width: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      fit: BoxFit.cover,
                      'https://images.pexels.com/photos/159201/circuit-circuit-board-resistor-computer-159201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                ),
                SizedBox(width: 10),
                Container(
                  height: 180,
                  width: 130,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      fit: BoxFit.cover,
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJst0_AIjA3Dv_lz3z_8tOHdjbL5NgA23g_ZJRfJobZsvugSV7h8oV1xJPzND18WxJvpI&usqp=CAU'),
                ),
                SizedBox(width: 10),
                Container(
                  height: 140,
                  width: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      fit: BoxFit.cover,
                      'https://cdn.pixabay.com/photo/2020/05/09/12/12/circuit-5149419__340.jpg'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Online Shopping",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.barlowCondensed(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    "Buy anything you need anywhere and anytime with the guarantee of the best goods.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.barlowCondensed(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Container(
      height: 300,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 50),
            child: Row(
              children: [
                Container(
                  height: 140,
                  width: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      fit: BoxFit.cover,
                      'https://images.pexels.com/photos/159201/circuit-circuit-board-resistor-computer-159201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                ),
                SizedBox(width: 10),
                Container(
                  height: 180,
                  width: 130,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      fit: BoxFit.cover,
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJst0_AIjA3Dv_lz3z_8tOHdjbL5NgA23g_ZJRfJobZsvugSV7h8oV1xJPzND18WxJvpI&usqp=CAU'),
                ),
                SizedBox(width: 10),
                Container(
                  height: 140,
                  width: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      fit: BoxFit.cover,
                      'https://cdn.pixabay.com/photo/2020/05/09/12/12/circuit-5149419__340.jpg'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "an affordable price",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.barlowCondensed(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    "we have very cheap prices with easy and simple transactions.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.barlowCondensed(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Container(
      height: 300,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 50),
            child: Row(
              children: [
                Container(
                  height: 140,
                  width: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      fit: BoxFit.cover,
                      'https://images.pexels.com/photos/159201/circuit-circuit-board-resistor-computer-159201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                ),
                SizedBox(width: 10),
                Container(
                  height: 180,
                  width: 130,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      fit: BoxFit.cover,
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJst0_AIjA3Dv_lz3z_8tOHdjbL5NgA23g_ZJRfJobZsvugSV7h8oV1xJPzND18WxJvpI&usqp=CAU'),
                ),
                SizedBox(width: 10),
                Container(
                  height: 140,
                  width: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      fit: BoxFit.cover,
                      'https://cdn.pixabay.com/photo/2020/05/09/12/12/circuit-5149419__340.jpg'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Tracking your Shipments",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.barlowCondensed(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    "Use the tracking system feature to get information about the courier on the map",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.barlowCondensed(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: background,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 400,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 30),
                    child: PageView(
                      children: _demo,
                      onPageChanged: (index) {
                        setState(() {
                          pageIndex = index;
                        });
                      },
                    ),
                  ),
                  CarouselIndicator(
                    height: 7,
                    width: 7,
                    color: biruterang,
                    activeColor: Colors.blue.shade900,
                    count: _demo.length,
                    index: pageIndex,
                    space: 7.0,
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              width: 150,
              margin: EdgeInsets.only(top: 30),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return const login();
                    }),
                  );
                },
                child: Text(
                  "Get Started",
                  style: GoogleFonts.barlowCondensed(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
