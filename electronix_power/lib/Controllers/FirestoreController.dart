import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreController extends GetxController {
  var brg = FirebaseFirestore.instance.collection("barang").obs;
  var register = FirebaseFirestore.instance.collection("users").obs;
  var dukungan = FirebaseFirestore.instance.collection("dukungan").obs;
}

Future<bool> checkUser(String email) async {
  var user = await FirebaseFirestore.instance
      .collection('register')
      .where('email', isEqualTo: email)
      .get();
  if (user.docs.isEmpty) {
    return true;
  } else {
    return false;
  }
}
