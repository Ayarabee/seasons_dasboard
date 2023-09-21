
abstract class AddCarStates {}

class AddCarInitialState extends AddCarStates {}

class AddCarLoadingState extends AddCarStates {}

class AddCarSuccessState extends AddCarStates {}

class AddCarErrorState extends AddCarStates
{
  String error;
  AddCarErrorState(this.error);
}
