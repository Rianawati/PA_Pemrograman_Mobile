import 'package:electronix_power/Controllers/FirestoreController.dart';
import 'package:electronix_power/Controllers/TextController.dart';
import 'package:electronix_power/login_register/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _formKey = GlobalKey<FormState>();
  String? _email, _password;
  final auth = FirebaseAuth.instance;
  FirestoreController fsc = Get.put(FirestoreController());
  RegisterController rc = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          child: ListView(
            children: [
              Container(
                child: Text(
                  'Register',
                  style: GoogleFonts.barlow(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 380,
                width: 380,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromARGB(255, 65, 65, 65).withOpacity(0.5),
                    width: 1,
                  ),
                ),
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 10),
                      child: TextField(
                        cursorColor: Color.fromARGB(255, 176, 205, 176),
                        decoration: InputDecoration(
                          floatingLabelStyle: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 114, 111, 111),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 114, 111, 111),
                            ),
                          ),
                          hintText: "Nama Depan",
                          hintStyle: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 114, 111, 111),
                          ),
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: false,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 10),
                      child: TextField(
                        cursorColor: Color.fromARGB(255, 176, 205, 176),
                        decoration: InputDecoration(
                          floatingLabelStyle: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 114, 111, 111),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 114, 111, 111),
                            ),
                          ),
                          hintText: "Nama Belakang",
                          hintStyle: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 114, 111, 111),
                          ),
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: false,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 10),
                      child: TextField(
                        cursorColor: Color.fromARGB(255, 176, 205, 176),
                        decoration: InputDecoration(
                          floatingLabelStyle: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 114, 111, 111),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 114, 111, 111),
                            ),
                          ),
                          hintText: "Email",
                          hintStyle: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 114, 111, 111),
                          ),
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: false,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _email = value.trim();
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 10),
                      child: TextField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Color.fromARGB(255, 176, 205, 176),
                        decoration: InputDecoration(
                          floatingLabelStyle: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 114, 111, 111),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 114, 111, 111),
                            ),
                          ),
                          hintText: "Password",
                          hintStyle: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 114, 111, 111),
                          ),
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: false,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _password = value.trim();
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 10),
                      child: TextField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Color.fromARGB(255, 176, 205, 176),
                        decoration: InputDecoration(
                          floatingLabelStyle: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 114, 111, 111),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 114, 111, 111),
                            ),
                          ),
                          hintText: "Konfirmasi Password",
                          hintStyle: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 114, 111, 111),
                          ),
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: false,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        cursorColor: Color.fromARGB(255, 176, 205, 176),
                        decoration: InputDecoration(
                          floatingLabelStyle: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 114, 111, 111),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 114, 111, 111),
                            ),
                          ),
                          hintText: "Nomer Telepon",
                          hintStyle: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 114, 111, 111),
                          ),
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  width: 450,
                  child: Text(
                    style: GoogleFonts.barlow(
                      color: Color.fromARGB(255, 100, 99, 99),
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                    "By clicking below, you agree to all the terms and conditions that apply to this Application.",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 300,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    auth
                        .createUserWithEmailAndPassword(
                            email: rc.emailCtrl.text,
                            password: rc.passwordCtrl.text)
                        .then((_) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => login()));
                    });
                    fsc.register.value.add({
                      'nama depan': rc.namaDepanCtrl.text,
                      'nama belakang': rc.namaBelakangCtrl.text,
                      'email': rc.emailCtrl.text,
                      'password': rc.passwordCtrl.text,
                      'konfirmasi password': rc.konfirmasiPasswordCtrl.text,
                      'nomor telepon': rc.nomorTeleponCtrl.text,
                    });
                    final snackBar = SnackBar(
                      content: Text('Registrasi Anda Berhasil !'),
                      action: SnackBarAction(
                        label: 'OKE',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    rc.namaDepanCtrl.clear();
                    rc.namaBelakangCtrl.clear();
                    rc.emailCtrl.clear();
                    rc.passwordCtrl.clear();
                    rc.konfirmasiPasswordCtrl.clear();
                    rc.nomorTeleponCtrl.clear();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "DAFTAR",
                    style: GoogleFonts.barlowCondensed(
                      color: Colors.white,
                      // fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 380,
                  padding: EdgeInsets.only(left: 120),
                  child: Row(
                    children: [
                      Center(
                        child: Text('Punya Akun ?'),
                      ),
                      Center(
                        child: TextButton(
                            child: Text('Login'),
                            onPressed: (() {
                              Navigator.pop(context);
                            })),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
