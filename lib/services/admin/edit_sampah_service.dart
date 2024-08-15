import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/sampah_model.dart';

class EditSampahService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<Map<String, dynamic>> editSampah(
      SampahModel sampahModel, XFile? image) async {
    try {
      if (image != null) {
        final String fileName =
            DateTime.now().millisecondsSinceEpoch.toString();
        final Reference reference = _storage.ref().child('sampah/$fileName');
        final UploadTask uploadTask = reference.putFile(File(image.path));
        await uploadTask.whenComplete(() => null);
        final String imageUrl = await reference.getDownloadURL();
        sampahModel.gambar = imageUrl;
      }
      await _firestore
          .collection('sampah')
          .doc(sampahModel.id)
          .update(sampahModel.toJson());
      return {
        'status': 'success',
      };
    } catch (e) {
      throw Exception(e);
    }
  }
}
