import 'dart:io';

import 'package:bank_sampah/models/barang_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class EditBarangService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<Map<String, dynamic>> editBarang(
      BarangModel barang, XFile? image) async {
    try {
      if (image != null) {
        final String fileName =
            DateTime.now().millisecondsSinceEpoch.toString();
        final Reference reference = _storage.ref().child('barang/$fileName');
        final UploadTask uploadTask = reference.putFile(File(image.path));
        await uploadTask.whenComplete(() => null);
        final String imageUrl = await reference.getDownloadURL();
        barang.image = imageUrl;
      }
      await _firestore
          .collection('barang')
          .doc(barang.id)
          .update(barang.toJson());
      return {
        'status': 'success',
      };
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
