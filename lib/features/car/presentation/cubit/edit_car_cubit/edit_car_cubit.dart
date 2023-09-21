import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/car_model.dart';
import '../../../data/repos/car_repo_implementation.dart';
import 'edit_car_states.dart';

class EditCarCubit extends Cubit<EditCarStates> {

  EditCarCubit(this.repo) :
        super(EditCarInitialState());

  final CarRepoImplementation repo;
  static EditCarCubit get (context) => BlocProvider.of(context);


  Future<void> editCar ({
  required CarModel car
  }) async
  {
    emit(EditCarLoadingState());
    var response = await repo.edit(
      car: car
    );
    response.fold((failure)
    {
      emit(EditCarErrorState(failure.errorMessage));
    }, (result)
    {
      emit(EditCarSuccessState());
    });
  }
}