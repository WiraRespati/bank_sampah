import 'dart:io';

import 'package:bank_sampah/models/barang_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TambahBarangService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload image to Firebase Storage
  Future<String> uploadImageBarang(XFile image) async {
    String imageUrl = '';
    try {
      final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final Reference reference = _storage.ref().child('barang/$fileName');
      final UploadTask uploadTask = reference.putFile(File(image.path));
      await uploadTask.whenComplete(() => null);
      imageUrl = await reference.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      Get.snackbar('Error', 'Failed to upload image (error: ${e.code})');
    }
    return imageUrl;
  }

  Future<void> addBarang(String imageUrl, String name, int price, int stock,
      String description) async {
    try {
      final DocumentReference documentReference =
          _firestore.collection('barang').doc();
      BarangModel barang = BarangModel(
        id: documentReference.id,
        name: name,
        image: imageUrl,
        description: description,
        price: price,
        stock: stock,
        createdAt: FieldValue.serverTimestamp(),
      );
      await documentReference.set(barang.toJson());
    } on FirebaseException catch (e) {
      Get.snackbar('Error', 'Failed to upload image (error: ${e.code})');
    }
  }
}
