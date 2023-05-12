import 'dart:io';
import 'package:electronix_power/home_page/home_page.dart';
import 'package:path/path.dart';
import 'package:electronix_power/Color/color.dart';
import 'package:electronix_power/Controllers/FirestoreController.dart';
import 'package:electronix_power/Controllers/TextController.dart';
import 'package:electronix_power/login_register/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

// ignore: prefer_typing_uninitialized_variables
String? namaBrgCtrl;
var nameImg;
File? image;

class create extends StatefulWidget {
  const create({Key? key}) : super(key: key);

  @override
  State<create> createState() => _createState();
}

class _createState extends State<create> {
  Widget coverEmpty() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20, right: 10, bottom: 10),
      height: 200,
      width: 120,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
      child: IconButton(
        splashRadius: 10,
        icon: const Icon(
          Icons.add_a_photo,
          size: 50,
          color: Colors.white,
        ),
        onPressed: () {
          takePhoto(ImageSource.gallery).then((File? file) {
            setState(() {
              image = file;
            });
          });
        },
      ),
    );
  }

  Widget cover() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20, right: 10, bottom: 10),
      height: 200,
      width: 120,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: FileImage(image!),
          fit: BoxFit.cover,
        ),
      ),
      child: IconButton(
        color: background,
        padding: const EdgeInsets.only(right: 80, top: 160),
        onPressed: () {
          takePhoto(ImageSource.gallery).then((File? file) {
            setState(() {
              image = file;
            });
          });
        },
        icon: const Icon(
          Icons.update_sharp,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  final ImagePicker _picker = ImagePicker();

  Future<File?> takePhoto(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    final File file = File(image!.path);
    return file;
  }

  final FocusNode _deskripsiFocus = FocusNode();
  final FocusNode _judulFocus = FocusNode();
  final FocusNode _whatsappFocus = FocusNode();
  final FocusNode _ownerFocus = FocusNode();
  String? downloadUrl;

  FirestoreController fsc = Get.put(FirestoreController());
  tulisController tc = Get.put(tulisController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Create Item Page',
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
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Form(
          key: _formKey,
          child: Scaffold(
            body: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: birugelap,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            image == null ? coverEmpty() : cover(),
                            Container(
                              height: 192,
                              width: MediaQuery.of(context).size.width - 170,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  TextFormField(
                                    maxLines: 2,
                                    controller: tc.namaBrgCtrl,
                                    focusNode: _judulFocus,
                                    onFieldSubmitted: (value) {
                                      _judulFocus.unfocus();
                                    },
                                    cursorColor: const Color.fromARGB(
                                        255, 176, 205, 176),
                                    decoration: InputDecoration(
                                      floatingLabelStyle:
                                          GoogleFonts.barlowCondensed(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 114, 111, 111),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 114, 111, 111),
                                        ),
                                      ),
                                      hintText: "ketik nama barang",
                                      hintStyle: GoogleFonts.barlowCondensed(
                                        textBaseline: TextBaseline.ideographic,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 83, 81, 81),
                                      ),
                                      fillColor: Colors.white.withOpacity(0.3),
                                      filled: false,
                                    ),
                                    style: GoogleFonts.barlowCondensed(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 48, 48, 48),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'nama barang tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    maxLines: 2,
                                    maxLength: 500,
                                    controller: tc.WhatsappCtrl,
                                    focusNode: _whatsappFocus,
                                    onFieldSubmitted: (value) {
                                      _deskripsiFocus.unfocus();
                                    },
                                    cursorColor: const Color.fromARGB(
                                        255, 176, 205, 176),
                                    decoration: InputDecoration(
                                      floatingLabelStyle:
                                          GoogleFonts.barlowCondensed(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 114, 111, 111),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 114, 111, 111),
                                        ),
                                      ),
                                      hintText: "ketik Nomer Whatsapp",
                                      hintStyle: GoogleFonts.barlowCondensed(
                                        textBaseline: TextBaseline.ideographic,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 83, 81, 81),
                                      ),
                                      fillColor: Colors.white.withOpacity(0.3),
                                      filled: false,
                                    ),
                                    style: GoogleFonts.barlowCondensed(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 48, 48, 48),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Deskripsi tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 34,
                                    width:
                                        MediaQuery.of(context).size.width - 180,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width - 10,
                          color: Colors.black.withOpacity(0.3),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            maxLength: 20,
                            textAlign: TextAlign.justify,
                            controller: tc.HargaCtrl,
                            keyboardType: TextInputType.number,
                            focusNode: _ownerFocus,
                            onFieldSubmitted: (value) {
                              _ownerFocus.unfocus();
                            },
                            cursorColor:
                                const Color.fromARGB(255, 176, 205, 176),
                            decoration: InputDecoration(
                              floatingLabelStyle: GoogleFonts.barlowCondensed(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 114, 111, 111),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 114, 111, 111),
                                ),
                              ),
                              hintText: "Harga",
                              hintStyle: GoogleFonts.barlowCondensed(
                                textBaseline: TextBaseline.ideographic,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 83, 81, 81),
                              ),
                              fillColor: Colors.white.withOpacity(0.3),
                              filled: false,
                            ),
                            style: GoogleFonts.barlowCondensed(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 48, 48, 48),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: TextFormField(
                            maxLines: 30,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20000),
                            ],
                            textAlign: TextAlign.justify,
                            controller: tc.DeskripsiCtrl,
                            focusNode: _deskripsiFocus,
                            onFieldSubmitted: (value) {
                              _whatsappFocus.unfocus();
                            },
                            cursorColor:
                                const Color.fromARGB(255, 176, 205, 176),
                            decoration: InputDecoration(
                              floatingLabelStyle: GoogleFonts.barlowCondensed(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 114, 111, 111),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 114, 111, 111),
                                ),
                              ),
                              hintText: "Deskripsi",
                              hintStyle: GoogleFonts.barlowCondensed(
                                textBaseline: TextBaseline.ideographic,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 83, 81, 81),
                              ),
                              fillColor: Colors.white.withOpacity(0.3),
                              filled: false,
                            ),
                            style: GoogleFonts.barlowCondensed(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 48, 48, 48),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 5),
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // Foreground color
                                  onPrimary: Colors.white,
                                  // Background color
                                  primary: Colors.blue.shade900,
                                ),
                                child: Text(
                                  'Kirim',
                                  style: GoogleFonts.barlowCondensed(
                                    letterSpacing: 1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  uploadImage();
                                  tc.fotoCtrl = basename(image!.path);
                                  fsc.brg.value.add({
                                    'Judul': tc.namaBrgCtrl.text,
                                    'Deskripsi': tc.DeskripsiCtrl.text,
                                    'Whatsapp': tc.WhatsappCtrl.text,
                                    'harga': tc.HargaCtrl.text,
                                    'foto': tc.fotoCtrl,
                                  });
                                  final snackBar = SnackBar(
                                    content:
                                        const Text('barang berhasil dikirim'),
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {
                                        // Some code to undo the change.
                                      },
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  tc.namaBrgCtrl.clear();
                                  tc.DeskripsiCtrl.clear();
                                  tc.WhatsappCtrl.clear();
                                  tc.HargaCtrl.clear();
                                  setState(
                                    () {
                                      image = null;
                                    },
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 5, right: 20),
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // Foreground color
                                  onPrimary: Colors.white,
                                  // Background color
                                  primary: Colors.blue.shade900,
                                ),
                                child: Text(
                                  'Reset',
                                  style: GoogleFonts.barlowCondensed(
                                    letterSpacing: 1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  tc.namaBrgCtrl.clear();
                                  tc.DeskripsiCtrl.clear();
                                  tc.WhatsappCtrl.clear();
                                  tc.HargaCtrl.clear();
                                  setState(
                                    () {
                                      image = null;
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String> uploadImage() async {
    namaBrgCtrl = '${nameImg}.jpg';
    nameImg = tc.namaBrgCtrl.text;
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref()
        .child("FotoBarang")
        .child(FirebaseAuth.instance.currentUser?.uid ??
            basename('${nameImg}.jpg'))
        .putFile(image!);
    return taskSnapshot.ref.getDownloadURL();
  }
}
