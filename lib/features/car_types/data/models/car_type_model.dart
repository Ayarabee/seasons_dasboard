class CarTypeModel {
  String? id;
  String? name;
  String? nameEn;

  CarTypeModel({this.id, required this.name, required this.nameEn});

  CarTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name-en'] = nameEn;
    return data;
  }
}
