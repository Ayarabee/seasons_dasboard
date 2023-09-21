class CityEditResponse {
  bool? success;
  String? message;
  String? countryId;

  CityEditResponse({this.success, this.message, this.countryId});

  CityEditResponse.fromJson( json) {
    if(json.contains('successfully')) {
      message = 'countries updated successfully';
    }
    else
    {
      message = '$json';
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['country_id'] = countryId;
    return data;
  }
}
