
import 'package:seasons_dashboard/features/car_types/data/models/car_type_model.dart';

abstract class CarTypesStates {}

class CarTypesInitialState extends CarTypesStates {}


// view
class ViewCarTypesLoadingState extends CarTypesStates {}
class ViewCarTypesSuccessState extends CarTypesStates {}
class ViewCarTypesErrorState extends CarTypesStates
{
  String error;
  ViewCarTypesErrorState(this.error);
}

// edit 
class EditCarTypeLoadingState extends CarTypesStates {}

class EditCarTypeSuccessState extends CarTypesStates {}

class EditCarTypeErrorState extends CarTypesStates
{
  String error;
  EditCarTypeErrorState(this.error);
}

// delete
class DeleteCarTypeLoadingState extends CarTypesStates {}

class DeleteCarTypeSuccessState extends CarTypesStates {}

class DeleteCarTypeErrorState extends CarTypesStates
{
  String error;
  DeleteCarTypeErrorState(this.error);
}

// add
class AddCarTypeLoadingState extends CarTypesStates {}

class AddCarTypeSuccessState extends CarTypesStates {}

class AddCarTypeErrorState extends CarTypesStates
{
  String error;
  AddCarTypeErrorState(this.error);
}

