import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/sampah_model.dart';

class TambahSampahService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload image to Firebase Storage
  Future<String> uploadImageSampah(XFile image) async {
    String imageUrl = '';
    try {
      final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final Reference reference = _storage.ref().child('sampah/$fileName');
      final UploadTask uploadTask = reference.putFile(File(image.path));
      await uploadTask.whenComplete(() => null);
      imageUrl = await reference.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      Get.snackbar('Error', 'Failed to upload image (error: ${e.code})');
    }
    return imageUrl;
  }

  Future<void> addSampah(
      String imageUrl, String name, int points, String description) async {
    try {
      final DocumentReference documentReference =
          _firestore.collection('sampah').doc();
      SampahModel sampah = SampahModel(
        id: documentReference.id,
        name: name,
        gambar: imageUrl,
        description: description,
        points: points,
        createdAt: Timestamp.now(),
      );
      await documentReference.set(sampah.toJson());
    } on FirebaseException catch (e) {
      Get.snackbar('Error', 'Failed to upload image (error: ${e.code})');
    }
  }
}
