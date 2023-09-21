class CityOperationResponse {
  bool? success;
  String? message;
  String? countryId;

  CityOperationResponse({this.success, this.message, this.countryId});

  CityOperationResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    countryId = json['country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['country_id'] = this.countryId;
    return data;
  }
}
