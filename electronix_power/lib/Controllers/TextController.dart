import 'package:electronix_power/Controllers/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var namaDepan = ''.obs;
  var namaBelakang = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var konfirmasiPassword = ''.obs;
  var nomorTelepon = ''.obs;

  final namaDepanCtrl = TextEditingController();
  final namaBelakangCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final konfirmasiPasswordCtrl = TextEditingController();
  final nomorTeleponCtrl = TextEditingController();

  onPressed() {
    namaDepan = namaDepanCtrl.text.obs;
    namaBelakang = namaBelakangCtrl.text.obs;
    email = emailCtrl.text.obs;
    password = passwordCtrl.text.obs;
    konfirmasiPassword = konfirmasiPasswordCtrl.text.obs;
    nomorTelepon = nomorTeleponCtrl.text.obs;
  }
}

class searchController extends GetxController {
  TextEditingController CariCTRL = TextEditingController();
}

class tulisController extends GetxController {
  // ignore: non_constant_identifier_names
  TextEditingController namaBrgCtrl = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController DeskripsiCtrl = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController WhatsappCtrl = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController HargaCtrl = TextEditingController();
  // ignore: non_constant_identifier_names
  String? fotoCtrl;
}

class DukunganController extends GetxController {
  // ignore: non_constant_identifier_names
  TextEditingController KomentarCtrl = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController SaranCtrl = TextEditingController();
}

class FotoController extends GetxController {
  final allpapperimage = <String>[].obs;

  @override
  void onReady() {
    getallPaper();
    super.onReady();
  }

  Future<void> getallPaper() async {
    List<String> imgName = [
      "KYLO blender Capsule",
      "MASPION EX-1010",
      "Pompa Air Minum",
      "Robot Pembersih",
      "TNW Vacum Cleaner",
    ];
    try {
      for (var img in imgName) {
        final imgUrl = await Get.find<FirebaseStorageServices>().getImage(img);
        allpapperimage.add(imgUrl!);
      }
    } catch (e) {
      print(e);
    }
  }
}
