import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/auth/data/repos/auth_repo_implementation.dart';

import 'reset_states.dart';

class ResetCubit extends Cubit<ResetStates> {

  ResetCubit(this.repo) :
        super(ResetInitialState());

  final AuthRepoImplementation repo;
  static ResetCubit get (context) => BlocProvider.of(context);


  Future<void> reset ({
  required String email,
  required String password,
  }) async
  {
    emit(ResetLoadingState());
    var response = await repo.reset(
        password: password
    );
    response.fold((failure)
    {
      emit(ResetErrorState(failure.errorMessage));
    }, (result)
    {
      emit(ResetSuccessState());
    });
  }
}