import 'package:bank_sampah/models/user_model.dart';
import 'package:bank_sampah/services/user/auth_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rxn<UserModel> userData = Rxn<UserModel>();

  void getUserData() async {
    try {
      final UserModel response = await AuthService().getUserData();
      userData.value = response;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat mengambil data',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
