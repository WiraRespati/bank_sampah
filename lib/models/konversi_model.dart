import 'package:cloud_firestore/cloud_firestore.dart';

class KonversiModel {
  String? id;
  String? userId;
  String? barangId;
  Timestamp? createdAt;

  KonversiModel({
    this.id,
    this.userId,
    this.barangId,
    this.createdAt,
  });

  KonversiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    barangId = json['barangId'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['barangId'] = barangId;
    data['createdAt'] = createdAt;
    return data;
  }
}
