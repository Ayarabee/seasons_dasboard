import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/auth/data/repos/auth_repo_implementation.dart';

import '../../../data/repos/auth_repo.dart';
import 'forget_states.dart';


class ForgetCubit extends Cubit<ForgetStates> {

  ForgetCubit(this.repo) :
        super(ForgetInitialState());

  final AuthRepoImplementation repo;
  static ForgetCubit get (context) => BlocProvider.of(context);


  Future<void> forget ({
  required String email
  }) async
  {
    emit(ForgetLoadingState());
    AuthRepo.email = email;
    var response = await repo.forget(
        email: email
    );
    response.fold((failure)
    {
      emit(ForgetErrorState(failure.errorMessage));
    }, (result)
    {
      emit(ForgetSuccessState());
    });
  }
}