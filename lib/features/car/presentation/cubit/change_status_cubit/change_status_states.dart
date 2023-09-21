

abstract class ChangeStatusStates {}

class ChangeStatusInitialState extends ChangeStatusStates {}

class ChangeStatusLoadingState extends ChangeStatusStates {}

class ChangeStatusSuccessState extends ChangeStatusStates {}
class ChangeStatusErrorState extends ChangeStatusStates
{
  String error;
  ChangeStatusErrorState(this.error);
}
