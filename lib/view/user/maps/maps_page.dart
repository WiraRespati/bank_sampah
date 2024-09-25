import 'package:bank_sampah/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    LatLng targetLocation = const LatLng(-1.2338871, 116.8522995);

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorCollection.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ColorPrimary.primary100,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logobs.png',
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 37,
                      width: 174,
                      child: SvgPicture.asset(
                        'assets/images/title_bank_sampah.svg',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: targetLocation,
                zoom: 18.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('targetLocation'),
                  position: targetLocation,
                  infoWindow: const InfoWindow(
                    title: 'Lokasi Bank Sampah',
                    snippet: 'Gedung Sekretariat LPM',
                  ),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}