import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/car_repo_implementation.dart';
import 'delete_car_states.dart';

class DeleteCarCubit extends Cubit<DeleteCarStates> {

  DeleteCarCubit(this.repo) :
        super(DeleteCarInitialState());

  final CarRepoImplementation repo;
  static DeleteCarCubit get (context) => BlocProvider.of(context);


  Future<void> deleteCar ({
  required String id,
  }) async
  {
    emit(DeleteCarLoadingState());
    var response = await repo.delete(
        id: id
    );
    response.fold((failure)
    {
      emit(DeleteCarErrorState(failure.errorMessage));
    }, (result)
    {
      emit(DeleteCarSuccessState());
    });
  }
}