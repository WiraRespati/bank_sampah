import 'package:cloud_firestore/cloud_firestore.dart';

class PengumpulanSampah {
  String? id;
  String? nik;
  String? description;
  String? image;
  int? points;
  FieldValue? createdAt;

  PengumpulanSampah({
    this.id,
    this.nik,
    this.description,
    this.image,
    this.points,
    this.createdAt,
  });

  factory PengumpulanSampah.fromJson(Map<String, dynamic> json) {
    return PengumpulanSampah(
      id: json['id'],
      nik: json['nik'],
      description: json['description'],
      image: json['image'],
      points: json['points'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nik': nik,
      'description': description,
      'image': image,
      'points': points,
      'createdAt': createdAt,
    };
  }
}
