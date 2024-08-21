import 'package:bank_sampah/models/jadwal_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowJadwalServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getAllJadwalData() async {
    try {
      final jadwalSnapshot = await _firestore
          .collection('jadwal')
          .orderBy("createdAt", descending: true)
          .get();

      List<JadwalModel> jadwalList = [];
      for (final jadwalData in jadwalSnapshot.docs) {
        JadwalModel jadwalModel = JadwalModel.fromJson(jadwalData.data());
        jadwalModel.id = jadwalData.id;
        jadwalList.add(jadwalModel);
      }

      return {
        'status': 'success',
        'jadwal': jadwalList,
      };
    } on Exception catch (e) {
      throw Exception('Failed to get jadwal data: $e');
    }
  }

  Future<void> deleteJadwal(String id) async {
    try {
      await _firestore.collection('jadwal').doc(id).delete();
    } on Exception catch (e) {
      throw Exception('Failed to delete jadwal: $e');
    }
  }
}