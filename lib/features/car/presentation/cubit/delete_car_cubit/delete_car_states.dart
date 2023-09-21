
abstract class DeleteCarStates {}

class DeleteCarInitialState extends DeleteCarStates {}

class DeleteCarLoadingState extends DeleteCarStates {}

class DeleteCarSuccessState extends DeleteCarStates {}

class DeleteCarErrorState extends DeleteCarStates
{
  String error;
  DeleteCarErrorState(this.error);
}
