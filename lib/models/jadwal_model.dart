import 'package:cloud_firestore/cloud_firestore.dart';

class JadwalModel {
  String? id;
  final String? day;
  final String? openTime;
  final String? closedTime;
  final Timestamp? createdAt;

  JadwalModel({
    this.id,
    this.day,
    this.openTime,
    this.closedTime,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'day': day,
      'openTime': openTime,
      'closedTime': closedTime,
      'createdAt': createdAt,
    };
  }

  factory JadwalModel.fromJson(Map<String, dynamic> json) {
    return JadwalModel(
      id: json['id'],
      day: json['day'],
      openTime: json['openTime'],
      closedTime: json['closedTime'],
      createdAt: json['createdAt'],
    );
  }
}
