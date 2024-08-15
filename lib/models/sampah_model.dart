import 'package:cloud_firestore/cloud_firestore.dart';

class SampahModel {
  String? id;
  String? name;
  String? description;
  int? points;
  String? gambar;
  Timestamp? createdAt;

  SampahModel({
    this.id,
    this.name,
    this.description,
    this.points,
    this.gambar,
    this.createdAt,
  });

  factory SampahModel.fromJson(Map<String, dynamic> json) {
    return SampahModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      points: json['points'],
      gambar: json['gambar'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'points': points,
      'gambar': gambar,
      'createdAt': createdAt,
    };
  }
}
