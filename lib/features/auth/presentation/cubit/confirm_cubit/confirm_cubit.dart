import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/auth/data/repos/auth_repo_implementation.dart';

import 'confirm_states.dart';

class ConfirmCubit extends Cubit<ConfirmStates> {

  ConfirmCubit(this.repo) :
        super(ConfirmInitialState());

  final AuthRepoImplementation repo;
  static ConfirmCubit get (context) => BlocProvider.of(context);


  Future<void> confirm ({
    required String code,
  }) async
  {
    emit(ConfirmLoadingState());
    var response = await repo.confirm(
        code: code
    );
    response.fold((failure)
    {
      emit(ConfirmErrorState(failure.errorMessage));
    }, (result)
    {
      emit(ConfirmSuccessState());
    });
  }
}