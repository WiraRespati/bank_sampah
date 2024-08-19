import 'package:bank_sampah/models/barang_model.dart';
import 'package:bank_sampah/models/konversi_model.dart';
import 'package:bank_sampah/models/pengumpulan_sampah_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RiwayatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Map<String, dynamic>> getAllRiwayatKonversi(String uid) async {
    try {
      final konversi = await _firestore
          .collection('konversi')
          .where('userId', isEqualTo: uid)
          .orderBy("createdAt", descending: true)
          .get();
      List<KonversiModel> listRiwayat = [];
      List<BarangModel> listBarang = [];
      for (final dataRiwayat in konversi.docs) {
        listRiwayat.add(KonversiModel.fromJson(dataRiwayat.data()));
      }

      for (final konversi in listRiwayat) {
        final barang =
            await _firestore.collection('barang').doc(konversi.barangId).get();
        listBarang.add(BarangModel.fromJson(barang.data()!));
      }

      return {
        'status': 'success',
        'riwayat': listRiwayat,
        'barang': listBarang,
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> getAllRiwayatMenabung() async {
    try {
      //get nik from user
      final user = await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();
      final nik = user.data()!['nik'];

      //fetch all pengumpulan sampah
      final pengumpulan = await _firestore
          .collection('pengumpulan_sampah')
          .where('nik', isEqualTo: nik)
          .orderBy("createdAt", descending: true)
          .get();
      List<PengumpulanSampah> listPengumpulan = [];
      for (final dataRiwayat in pengumpulan.docs) {
        listPengumpulan.add(PengumpulanSampah.fromJson(dataRiwayat.data()));
      }
      return {
        'status': 'success',
        'riwayat': listPengumpulan,
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': e.toString(),
      };
    }
  }
}
