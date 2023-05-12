import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electronix_power/Color/color.dart';
import 'package:electronix_power/Controllers/FirestoreController.dart';
import 'package:electronix_power/Pager/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class utama extends StatelessWidget {
  dynamic _desk;
  dynamic _wa;
  utama({super.key});

  FirestoreController fsc = Get.put(FirestoreController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Discover',
                          style: GoogleFonts.barlowCondensed(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'New Collections',
                          style: GoogleFonts.barlowCondensed(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: ((value) {}),
                    // controller: ,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.2),
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                      hintText: "Search",
                      suffixIcon: const Icon(
                        Icons.people,
                        color: Color.fromARGB(255, 114, 111, 111),
                      ),
                      hintStyle: GoogleFonts.barlowCondensed(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 114, 111, 111),
                      ),
                      fillColor: Colors.grey.withOpacity(0.2),
                      filled: true,
                    ),
                  ),
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                color: birugelap,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: const DecorationImage(
                  image: AssetImage("assets/logo.png"),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 94,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Camera Payday',
                      style: GoogleFonts.barlowCondensed(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          '70% off all Item',
                          style: GoogleFonts.barlowCondensed(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        width: 90,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: (() {}),
                          child: Text(
                            'Buy Now',
                            style: GoogleFonts.barlow(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height - 419,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: birugelap,
              ),
              child: ListView(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: fsc.brg.value.snapshots(),
                    builder: ((context, snapshot) {
                      return snapshot.hasData
                          ? Column(
                              children: snapshot.data!.docs
                                  .map(
                                    (e) => Container(
                                      margin: const EdgeInsets.only(
                                          left: 3, right: 3, top: 3),
                                      color: biruterang,
                                      child: ListTile(
                                        leading: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                '${e.get('foto')}')),
                                        title: Text("${e.get('Judul')}"),
                                        subtitle: Text("${e.get('harga')}"),
                                        trailing: IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (_) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (_) => detail(
                                                          Judul: e.get('Judul'),
                                                          Harga: e.get('harga'),
                                                          foto: e.get("foto"),
                                                          Deskripsi: e
                                                              .get("Deskripsi"),
                                                          whatsapp:
                                                              e.get("Whatsapp"),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }),
                                            );
                                          },
                                          icon: const Icon(Icons.arrow_forward),
                                        ),
                                        selectedTileColor: birugelap,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            )
                          : const Center(
                              child: Text('Tidak Ada Barang Yang Dijual !',
                                  textAlign: TextAlign.center),
                            );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
