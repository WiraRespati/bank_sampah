import 'package:bank_sampah/models/pengumpulan_sampah_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RiwayatMenabungService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getAllRiwayatMenabung() async {
    try {
      final menabung = await _firestore
          .collection('pengumpulan_sampah')
          .orderBy("createdAt", descending: true)
          .get();
      PengumpulanSampah pengumpulanSampah = PengumpulanSampah();
      List<PengumpulanSampah> listRiwayat = [];
      for (final dataRiwayat in menabung.docs) {
        pengumpulanSampah = PengumpulanSampah.fromJson(dataRiwayat.data());
        listRiwayat.add(pengumpulanSampah);
      }

      return {
        'status': 'success',
        'riwayat': listRiwayat,
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': e.toString(),
      };
    }
  }
}
