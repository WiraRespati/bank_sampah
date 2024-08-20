import 'package:bank_sampah/services/user/auth_service.dart';
import 'package:bank_sampah/view/admin/bottom_navbar_admin/bottom_navbar_admin.dart';
import 'package:bank_sampah/view/user/bottom_navbar/bottom_navbar.dart';
import 'package:get/get.dart';
import '../../view/user/onboarding/onboarding_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextPage();
  }

  void _navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 3));
    if (AuthService().user == null) {
      Get.offAll(() =>  const OnboardingPage());
    } else {
      bool isAdmin = await AuthService().checkAdmin();
      if (isAdmin) {
        Get.offAll(() => BottomNavbarAdmin());
      } else {
        Get.offAll(() => BottomNavbar());
      }
    }
  }
}
