import 'package:bank_sampah/models/konversi_model.dart';
import 'package:bank_sampah/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowRiwayatKonversiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getAllRiwayatKonversi() async {
    try {
      final konversi = await _firestore
          .collection('konversi')
          .orderBy("createdAt", descending: true)
          .get();
      List<KonversiModel> listRiwayat = [];
      List<UserModel> listUser = [];
      for (final dataRiwayat in konversi.docs) {
        listRiwayat.add(KonversiModel.fromJson(dataRiwayat.data()));
      }

      for (final konversi in listRiwayat) {
        final user =
            await _firestore.collection('users').doc(konversi.userId).get();
        listUser.add(UserModel.fromJson(user.data()!));
      }
      return {
        'status': 'success',
        'riwayat': listRiwayat,
        'users': listUser,
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> getFilteredRiwayatKonversi(DateTime time) async {
    try {
      final konversi = await _firestore
          .collection('konversi')
          .where('createdAt', isGreaterThanOrEqualTo: time)
          .orderBy("createdAt", descending: true)
          .get();
      List<KonversiModel> listRiwayat = [];
      List<UserModel> listUser = [];
      for (final dataRiwayat in konversi.docs) {
        listRiwayat.add(KonversiModel.fromJson(dataRiwayat.data()));
      }

      for (final konversi in listRiwayat) {
        final user =
            await _firestore.collection('users').doc(konversi.userId).get();
        listUser.add(UserModel.fromJson(user.data()!));
      }
      return {
        'status': 'success',
        'riwayat': listRiwayat,
        'users': listUser,
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': e.toString(),
      };
    }
  }
}
