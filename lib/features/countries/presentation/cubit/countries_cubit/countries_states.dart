
abstract class CountriesStates {}

class CountriesInitialState extends CountriesStates {}

class ViewCountriesLoadingState extends CountriesStates {}

class ViewCountriesSuccessState extends CountriesStates {}
class ViewCountriesErrorState extends CountriesStates
{
  String error;
  ViewCountriesErrorState(this.error);
}

class EditCountryLoadingState extends CountriesStates {}

class EditCountrySuccessState extends CountriesStates {}

class EditCountryErrorState extends CountriesStates
{
  String error;
  EditCountryErrorState(this.error);
}


class DeleteCountryLoadingState extends CountriesStates {}

class DeleteCountrySuccessState extends CountriesStates {}

class DeleteCountryErrorState extends CountriesStates
{
  String error;
  DeleteCountryErrorState(this.error);
}


class AddCountryLoadingState extends CountriesStates {}

class AddCountrySuccessState extends CountriesStates {}

class AddCountryErrorState extends CountriesStates
{
  String error;
  AddCountryErrorState(this.error);
}
