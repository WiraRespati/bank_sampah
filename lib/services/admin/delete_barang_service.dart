import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/barang_model.dart';

class DeleteBarangService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<Map<String, dynamic>> deleteBarang(BarangModel barang) async {
    try {
      await _firestore.collection('barang').doc(barang.id).delete();
      await _firebaseStorage.refFromURL(barang.image!).delete();
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
