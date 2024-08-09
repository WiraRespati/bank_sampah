import 'package:get/get.dart';

class ItemHomeAdminController extends GetxController {
  var isTapped = false.obs;

  void setTapped(bool tapped) {
    isTapped.value = tapped;
  }
}