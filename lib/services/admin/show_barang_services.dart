import 'package:bank_sampah/models/barang_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowBarangServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getAllBarangData() async {
    try {
      final barangSnapshot = await _firestore.collection('barang').get();

      BarangModel barangModel = BarangModel();
      List<BarangModel> barang = [];
      for (final barangData in barangSnapshot.docs) {
        barangModel = BarangModel.fromJson(barangData.data());
        barangModel.id = barangData.id;
        barang.add(barangModel);
      }

      return {
        'status': 'success',
        'barang': barang,
      };
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteBarang(String id) async {
    try {
      await _firestore.collection('barang').doc(id).delete();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
