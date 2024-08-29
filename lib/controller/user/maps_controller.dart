// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsController extends GetxController {
  Future<void> openGoogleMaps(double latitude, double longitude) async {
    final String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
