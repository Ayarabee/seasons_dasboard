
abstract class ForgetStates {}

class ForgetInitialState extends ForgetStates {}

class ForgetLoadingState extends ForgetStates {}

class ForgetSuccessState extends ForgetStates {}

class ForgetErrorState extends ForgetStates
{
  String error;
  ForgetErrorState(this.error);
}
