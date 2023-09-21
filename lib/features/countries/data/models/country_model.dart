import 'dart:typed_data';

import 'package:dio/dio.dart';

class CountryModel {
  String? id;
  String? name;
  String? nameEn;
  String? img;
  String? createdAt;
  String? updatedAt;
  Uint8List? imageUpload;

  CountryModel(
      {this.id,
        this.name,
        this.nameEn,
        this.img,
        this.createdAt,
        this.updatedAt});

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
  Map<String, dynamic> toJsonWithImage() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['img'] = MultipartFile.fromBytes(
        imageUpload!,
        filename: 'first.jpg'
    );
    return data;
  }
}
