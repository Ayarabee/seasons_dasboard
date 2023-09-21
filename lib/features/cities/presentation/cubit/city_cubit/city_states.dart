

import 'package:seasons_dashboard/features/cities/data/models/city_model.dart';

abstract class CityStates {}

class ViewCitiesInitialState extends CityStates {}

class ViewCitiesLoadingState extends CityStates {}

class ViewCitiesSuccessState extends CityStates
{
  List <CityModel> cities =[];
  ViewCitiesSuccessState(this.cities);
}
class ViewCitiesErrorState extends CityStates
{
  String error;
  ViewCitiesErrorState(this.error);
}


class AddCityLoadingState extends CityStates {}

class AddCitySuccessState extends CityStates {}

class AddCityErrorState extends CityStates
{
  String error;
  AddCityErrorState(this.error);
}


class DeleteCityLoadingState extends CityStates {}

class DeleteCitySuccessState extends CityStates {}

class DeleteCityErrorState extends CityStates
{
  String error;
  DeleteCityErrorState(this.error);
}


class EditCityLoadingState extends CityStates {}

class EditCitySuccessState extends CityStates {}

class EditCityErrorState extends CityStates
{
  String error;
  EditCityErrorState(this.error);
}
