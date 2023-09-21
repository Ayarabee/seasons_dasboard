


import 'package:seasons_dashboard/core/core_models/user_model.dart';

abstract class UsersStates {}

class UsersInitialState extends UsersStates {}

// view 
class ViewAllUsersLoadingState extends UsersStates {}

class ViewAllUsersSuccessState extends UsersStates {}

class ViewAllUsersErrorState extends UsersStates
{
  String error;
  ViewAllUsersErrorState(this.error);
}

// edit

class EditLoadingState extends UsersStates {}

class EditSuccessState extends UsersStates {}

class EditErrorState extends UsersStates
{
  String error;
  EditErrorState(this.error);
}

// add
class AddLoadingState extends UsersStates {}

class AddSuccessState extends UsersStates {}

class AddErrorState extends UsersStates
{
  String error;
  AddErrorState(this.error);
}

// delete
class DeleteLoadingState extends UsersStates {}

class DeleteSuccessState extends UsersStates {}

class DeleteErrorState extends UsersStates
{
  String error;
  DeleteErrorState(this.error);
}
