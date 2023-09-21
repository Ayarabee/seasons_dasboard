import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/auth/data/repos/auth_repo_implementation.dart';

import 'login_states.dart';


class LoginCubit extends Cubit<LoginStates> {

  LoginCubit(this.repo) :
        super(LoginInitialState());

  final AuthRepoImplementation repo;
  static LoginCubit get (context) => BlocProvider.of(context);


  Future<void> login ({
  required String email,
  required String password,
  }) async
  {
    emit(LoginLoadingState());
    var response = await repo.login(
        email: email,
        password: password
    );
    response.fold((failure)
    {
      emit(LoginErrorState(failure.errorMessage));
    }, (result)
    {
      emit(LoginSuccessState());
    });
  }
}