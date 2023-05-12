import 'package:electronix_power/Color/color.dart';
import 'package:electronix_power/Controllers/FirestoreController.dart';
import 'package:electronix_power/Controllers/TextController.dart';
import 'package:electronix_power/create_data.dart';
import 'package:electronix_power/home_page/home_page.dart';
import 'package:electronix_power/login_register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

var errorMessage;

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final auth = FirebaseAuth.instance;
  FirestoreController fsc = Get.put(FirestoreController());
  RegisterController rc = Get.put(RegisterController());
  final _formKey = GlobalKey<FormState>();
  var _email, _password;
  @override
  Widget build(BuildContext context) {
    final maxLines = 1;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: background,
          ),
          child: ListView(
            children: [
              Container(
                height: 190,
                width: 190,
                margin: const EdgeInsets.only(top: 50),
                child: const Image(
                  image: AssetImage("assets/logo.png"),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
                child: TextFormField(
                  controller: rc.emailCtrl,
                  cursorColor: const Color.fromARGB(255, 176, 205, 176),
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide: const BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    hintText: "Email",
                    prefixIcon: const Icon(
                      Icons.people,
                      color: Color.fromARGB(255, 114, 111, 111),
                    ),
                    hintStyle: GoogleFonts.barlowCondensed(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 114, 111, 111),
                    ),
                    fillColor: Colors.white.withOpacity(0.3),
                    filled: true,
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Email tidak boleh kosong' : null,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
                child: TextFormField(
                  controller: rc.passwordCtrl,
                  cursorColor: const Color.fromARGB(255, 176, 205, 176),
                  maxLines: maxLines,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide: const BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.key,
                        color: Color.fromARGB(255, 114, 111, 111)),
                    hintStyle: GoogleFonts.barlowCondensed(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 114, 111, 111),
                    ),
                    fillColor: Colors.white.withOpacity(0.3),
                    filled: true,
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Password tidak boleh kosong' : null,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 50, right: 50),
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: biruterang,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    try {
                      auth
                          .signInWithEmailAndPassword(
                              email: rc.emailCtrl.text,
                              password: rc.passwordCtrl.text)
                          .then((_) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const homepage()));
                      });
                      rc.emailCtrl.clear();
                      rc.passwordCtrl.clear();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Login Anda Berhasil !'),
                        action: SnackBarAction(
                          label: 'OKE',
                          onPressed: () {},
                        ),
                      ));
                    } on PlatformException catch (e) {
                    } catch (e) {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const login()),
                        );
                      }
                      print(e);
                      setState(() {
                        errorMessage = e.toString();
                      });
                      final snackBar = SnackBar(
                        content: Text(errorMessage),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text(
                    "LOGIN",
                    style: GoogleFonts.barlowCondensed(
                      color: const Color.fromARGB(255, 114, 111, 111),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 95),
                child: Row(
                  children: [
                    Text(
                      'Register Now ? ',
                      style: GoogleFonts.barlowCondensed(),
                    ),
                    TextButton(
                        child: Text('Create on account',
                            style: GoogleFonts.barlowCondensed()),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const register()),
                          );
                        }),
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

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  return firebaseApp;
}
