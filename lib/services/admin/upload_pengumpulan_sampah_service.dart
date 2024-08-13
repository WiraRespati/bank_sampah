import 'dart:io';

import 'package:bank_sampah/models/pengumpulan_sampah_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadPengumpulanSampahService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImagePengumpulanSampah(XFile image) async {
    String imageUrl = '';
    try {
      final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final Reference reference =
          _storage.ref().child('pengumpulan_sampah/$fileName');
      final UploadTask uploadTask = reference.putFile(File(image.path));
      await uploadTask.whenComplete(() => null);
      imageUrl = await reference.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      Get.snackbar('Error', 'Failed to upload image (error: ${e.code})');
    }
    return imageUrl;
  }

  Future<void> addPengumpulanSampah(
      String imageUrl, String nik, String description, int points) async {
    try {
      final DocumentReference documentReference =
          _firestore.collection('pengumpulan_sampah').doc();
      PengumpulanSampah pengumpulanSampah = PengumpulanSampah(
        id: documentReference.id,
        image: imageUrl,
        nik: nik,
        createdAt: FieldValue.serverTimestamp(),
        description: description,
        points: points,
      );
      await documentReference.set(pengumpulanSampah.toJson());
    } on FirebaseException catch (e) {
      Get.snackbar('Error', 'Failed to upload data (error: ${e.code})');
    }
  }
}
