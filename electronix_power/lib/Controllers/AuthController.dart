import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electronix_power/Controllers/FirestoreController.dart';
import 'package:electronix_power/home_page/home_page.dart';
import 'package:electronix_power/login_register/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final FirestoreController fsc = Get.put(FirestoreController());
  final currentUser = FirebaseAuth.instance.currentUser;

  final googleSignIn = GoogleSignIn();

  User? _user;

  User get user => _user!;

  Future<Widget> checkLoggedIn() async {
    if (currentUser != null) {
      _user = currentUser;
      return homepage();
    } else {
      return login();
    }
  }

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredentialData =
          await FirebaseAuth.instance.signInWithCredential(credential);

      _user = userCredentialData.user;

      await isNewUser(_user) ? await addUser(_user) : print("Udah ada");

      Get.offAll(() => homepage());
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    Get.dialog(
        Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false);

    await FirebaseAuth.instance.signOut();

    Get.back();

    Get.offAll(() => login());
  }

  Future<bool> isNewUser(User? user) async {
    QuerySnapshot res =
        await fsc.register.value.where("email", isEqualTo: user!.email).get();
    final List<DocumentSnapshot> docs = res.docs;
    return docs.isEmpty ? true : false;
  }

  Future<void> addUser(User? user) async {
    fsc.register.value.doc(user!.uid).set({
      'email': user.email,
      'name': user.displayName,
      'profilePhoto': user.photoURL,
    });
  }
}
