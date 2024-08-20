import 'package:bank_sampah/models/sampah_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DeleteSampahService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<Map<String, dynamic>> deleteSampah(SampahModel sampah) async {
    try {
      await _firestore.collection('sampah').doc(sampah.id).delete();
      await _firebaseStorage.refFromURL(sampah.gambar!).delete();
      return {
        'status': 'success',
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': e.toString(),
      };
    }
  }
}
