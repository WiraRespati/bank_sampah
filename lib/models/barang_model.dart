import 'package:cloud_firestore/cloud_firestore.dart';

class BarangModel {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;
  int? stock;
  FieldValue? createdAt;

  BarangModel({
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
    this.stock,
    this.createdAt,
  });

  factory BarangModel.fromJson(Map<String, dynamic> json) {
    return BarangModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: json['price'],
      stock: json['stock'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'stock': stock,
      'createdAt': createdAt,
    };
  }
}
