class CountryEditResponse {
  bool? success;
  String? message;
  String? countryId;

  CountryEditResponse({this.success, this.message, this.countryId});

  CountryEditResponse.fromJson(json) {
    if(json == '{"message":"countries updated successfully"}') {
      message = 'countries updated successfully';
    }
    else
    {
      message = '$json';
    }
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

 */