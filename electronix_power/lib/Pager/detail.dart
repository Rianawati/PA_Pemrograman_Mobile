// ignore_for_file: must_be_immutable
import 'package:url_launcher/url_launcher.dart';
import 'package:electronix_power/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: camel_case_types
class detail extends StatelessWidget {
  // ignore: non_constant_identifier_names
  String Judul;
  // ignore: non_constant_identifier_names
  String Harga;
  // ignore: non_constant_identifier_names
  String Deskripsi;
  String foto;
  final String whatsapp;
  detail({
    Key? key,
    // ignore: non_constant_identifier_names
    required this.Judul,
    // ignore: non_constant_identifier_names
    required this.Harga,
    // ignore: non_constant_identifier_names
    required this.Deskripsi,
    required this.foto,
    required this.whatsapp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Detail Page',
          style: GoogleFonts.barlowCondensed(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return const homepage();
              }),
            );
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
        ),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage(
                        foto,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 300,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.white.withOpacity(0.7),
                                BlendMode.srcOver),
                            fit: BoxFit.cover,
                            image: const NetworkImage(
                                'https://images.unsplash.com/photo-1536195892759-c8a3c8e1945e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YWVzdGhldGljfGVufDB8fDB8fA%3D%3D&w=1000&q=80'))),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            alignment: Alignment.topLeft,
                            child: Text(Judul,
                                style: GoogleFonts.barlowCondensed(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 28,
                                )),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            alignment: Alignment.topLeft,
                            child: Text("Rp.$Harga",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.barlowCondensed(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            alignment: Alignment.topLeft,
                            child: Text("\nDeskripsi",
                                style: GoogleFonts.barlowCondensed(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 25,
                                )),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, top: 5, right: 20),
                            alignment: Alignment.topLeft,
                            child: Text("$Deskripsi\n\n",
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.barlowCondensed(
                                  color: Colors.black,
                                  fontSize: 16,
                                )),
                          ),
                          Container(
                            width: 300,
                            height: 60,
                            padding: const EdgeInsets.only(
                                left: 20, top: 5, right: 20),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue.shade900,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () async {
                                var url =
                                    "https://wa.me/$whatsapp?text=HALLO,%20Apakah%20$Judul%20masih%20ada%20?.%20saya%20ingin%20membeli.";
                                // ignore: deprecated_member_use
                                if (await canLaunch(url)) {
                                  // ignore: deprecated_member_use
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                                // ignore: use_build_context_synchronously
                                Alert(
                                    context: context,
                                    title: "YOUR ORDER IS RECEIVED",
                                    desc:
                                        "then you will be directed to order via whatsapp.",
                                    image: Image.asset("assets/ceklis.png"),
                                    buttons: [
                                      DialogButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const homepage()),
                                          );
                                        },
                                        child: const Text(
                                          "OKE",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      )
                                    ]).show();
                              },
                              child: Text(
                                "GET BUY",
                                style: GoogleFonts.barlowCondensed(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
