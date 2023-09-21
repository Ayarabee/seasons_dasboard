
abstract class EditCarStates {}

class EditCarInitialState extends EditCarStates {}

class EditCarLoadingState extends EditCarStates {}

class EditCarSuccessState extends EditCarStates {}

class EditCarErrorState extends EditCarStates
{
  String error;
  EditCarErrorState(this.error);
}
