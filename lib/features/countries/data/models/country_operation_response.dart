class CountryOperationResponse {
  bool? success;
  String? message;
  String? countryId;

  CountryOperationResponse({this.success, this.message, this.countryId});

  CountryOperationResponse.fromJson(Map<String, dynamic> json) {
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

/*
if(json == '{"message":"countries updated successfully"}') {
      message = 'countries updated successfully';
    }
    else
    {

    }
 */