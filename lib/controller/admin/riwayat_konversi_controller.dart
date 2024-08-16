import 'package:get/get.dart';

class RiwayatKonversiController extends GetxController {
  var selectedPeriod = '1 hari'.obs;

  void updatePeriod(String period) {
    selectedPeriod.value = period;
  }
}