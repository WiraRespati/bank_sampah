import 'package:cloud_firestore/cloud_firestore.dart';

class KonversiModel {
  String? id;
  String? userId;
  String? namaBarang;
  String? imageBarang;
  String? deskripsiBarang;
  int? hargaBarang;
  Timestamp? createdAt;

  KonversiModel({
    this.id,
    this.userId,
    this.namaBarang,
    this.imageBarang,
    this.deskripsiBarang,
    this.hargaBarang,
    this.createdAt,
  });

  KonversiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    namaBarang = json['namaBarang'];
    imageBarang = json['imageBarang'];
    deskripsiBarang = json['deskripsiBarang'];
    hargaBarang = json['hargaBarang'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['namaBarang'] = namaBarang;
    data['imageBarang'] = imageBarang;
    data['deskripsiBarang'] = deskripsiBarang;
    data['hargaBarang'] = hargaBarang;
    data['createdAt'] = createdAt;
    return data;
  }
}
