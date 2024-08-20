import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/admin/show_total_points_service.dart';

class TotalPointsController extends GetxController {
  final totalPoints = 0.obs;

  void getTotalPoints() async {
    await ShowTotalPointsService().getTotalPoints().then((value) {
      if (value['status'] == 'success') {
        totalPoints.value = value['totalPoints'];
      } else {
        Get.snackbar(
          'Error',
          value['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    });
  }
}
