

import 'package:seasons_dashboard/features/cities/data/models/city_model.dart';

abstract class ConfirmStates {}

class ConfirmInitialState extends ConfirmStates {}

class ConfirmLoadingState extends ConfirmStates {}

class ConfirmSuccessState extends ConfirmStates {}

class ConfirmErrorState extends ConfirmStates
{
  String error;
  ConfirmErrorState(this.error);
}
