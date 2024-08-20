import 'package:bank_sampah/models/barang_model.dart';
import 'package:bank_sampah/models/konversi_model.dart';
import 'package:bank_sampah/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KonversiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> konversiBarang(
      UserModel userModel, BarangModel barangModel) async {
    try {
      final DocumentReference doc = _firestore.collection('konversi').doc();
      KonversiModel konversiModel = KonversiModel(
        id: doc.id,
        userId: userModel.uid,
        namaBarang: barangModel.name,
        imageBarang: barangModel.image,
        deskripsiBarang: barangModel.description,
        hargaBarang: barangModel.price,
        createdAt: Timestamp.now(),
      );
      await doc.set(konversiModel.toJson());
      await _firestore.collection('users').doc(userModel.uid).update({
        'points': userModel.points! - barangModel.price!,
      });

      await _firestore.collection('barang').doc(barangModel.id).update({
        'stock': barangModel.stock! - 1,
      });
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
