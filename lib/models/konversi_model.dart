class KonversiModel {
  String? id;
  String? userId;
  String? barangId;

  KonversiModel({
    this.id,
    this.userId,
    this.barangId,
  });

  KonversiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    barangId = json['barangId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['barangId'] = barangId;
    return data;
  }
}
