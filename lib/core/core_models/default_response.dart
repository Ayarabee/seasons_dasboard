import 'package:seasons_dashboard/core/core_models/user_model.dart';

class DefaultResponse {
  bool? success;
  UserModel? userModel;
  String? message;

  DefaultResponse({this.success, this.userModel, this.message});

  DefaultResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'] ;
    userModel = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (userModel != null) {
      data['data'] = userModel!.toJson();
    }
    return data;
  }
}
