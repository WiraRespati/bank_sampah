import 'package:get/get.dart';

class ItemProfileController extends GetxController {
  var isTapped = false.obs;

  void setTapped(bool value) {
    isTapped.value = value;
  }
}