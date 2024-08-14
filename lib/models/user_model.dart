class UserModel {
  String? uid;
  String? nik;
  String? name;
  String? gender;
  String? phone;
  String? email;
  int? points;
  String? role;

  UserModel({
    this.uid,
    this.nik,
    this.name,
    this.gender,
    this.phone,
    this.email,
    this.points = 0,
    this.role = 'user',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      nik: json['nik'],
      gender: json['gender'],
      phone: json['phone'],
      points: json['points'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'nik': nik,
      'name': name,
      'gender': gender,
      'phone': phone,
      'email': email,
      'points': points,
      'role': role,
    };
  }
}
