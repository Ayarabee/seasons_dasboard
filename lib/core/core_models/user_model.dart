
import 'dart:typed_data';

import 'package:dio/dio.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? password;
  String? type;
  String? discount;
  String? balance;
  String? img;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  String? verificationCode;
  Uint8List? imageUpload;
  bool fromAddBalance= false;

  UserModel(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.password,
        this.type,
        this.discount,
        this.balance,
        this.img,
        this.imageUpload,
        this.rememberToken,
        this.createdAt,
        this.updatedAt,
        this.verificationCode});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    type = json['type'];
    discount = json['discount'];
    balance = json['balance'];
    img = json['img'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    verificationCode = json['verification_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['type'] = this.type;
    data['discount'] = this.discount;
    data['balance'] = this.balance;
    data['img'] = this.img;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['verification_code'] = this.verificationCode;
    return data;
  }

  Map<String, dynamic> toJsonWithImage() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['type'] = this.type;
    data['discount'] = this.discount;
    data['balance'] = this.balance;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['verification_code'] = this.verificationCode;
    data['img'] = MultipartFile.fromBytes(
        imageUpload!,
      filename: 'first.jpg'
    );
    return data;
  }
}
