import 'package:bank_sampah/models/sampah_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowSampahService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getAllSampahData() async {
    try {
      final sampahSnapshot = await _firestore
          .collection('sampah')
          .orderBy("createdAt", descending: true)
          .get();

      List<SampahModel> sampah = [];

      for (final sampahData in sampahSnapshot.docs) {
        sampah.add(SampahModel.fromJson(sampahData.data()));
      }

      return {
        'status': 'success',
        'sampah': sampah,
      };
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
