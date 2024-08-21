import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          KelolaHeaderWidget(
            title: "Lokasi Bank Sampah",
            onPressed: () {
              Get.back();
            },
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(-1.2338871, 116.8522995),
                zoom: 18.0,
              ),
              markers: {
                const Marker(
                  markerId: MarkerId('target'),
                  position: LatLng(-1.2338871, 116.8522995),
                  infoWindow: InfoWindow(
                    title: 'Gedung LPM',
                    snippet: 'Lokasi Bank Sampah',
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
