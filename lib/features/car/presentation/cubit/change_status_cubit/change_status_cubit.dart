import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/car_repo_implementation.dart';
import 'change_status_states.dart';


class ChangeStatusCubit extends Cubit<ChangeStatusStates> {

  ChangeStatusCubit(this.repo) :
        super(ChangeStatusInitialState());

  final CarRepoImplementation repo;
  static ChangeStatusCubit get (context) => BlocProvider.of(context);


  Future<void> changeStatus ({
    required String id, required String status
}) async
  {
    emit(ChangeStatusLoadingState());
    var response = await repo.status(id: id, status: status);

    response.fold((failure)
    {
      emit(ChangeStatusErrorState(failure.errorMessage));
    }, (result)
    {
      emit(ChangeStatusSuccessState());
    });
  }
}