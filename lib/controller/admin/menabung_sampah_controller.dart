import 'package:get/get.dart';

class MenabungSampahController extends GetxController {
  var isTapped = false.obs;

  void setTapped(bool tapped) {
    isTapped.value = tapped;
  }
}