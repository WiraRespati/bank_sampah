import 'package:bank_sampah/models/jadwal_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddJadwalService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addJadwal(
    String day,
    String openTime,
    String closedTime,
  ) async {
    try {
      final DocumentReference documentReference =
          _firestore.collection('jadwal').doc();
      JadwalModel jadwal = JadwalModel(
        day: day,
        openTime: openTime,
        closedTime: closedTime,
        createdAt: Timestamp.now(),
      );
      await documentReference.set(jadwal.toJson());
    } on FirebaseException catch (e) {
      Get.snackbar('Error', 'Failed to add Schedule (error: ${e.code})');
    }
  }
}