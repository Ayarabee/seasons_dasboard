import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/car/data/models/car_model.dart';
import 'package:seasons_dashboard/features/car/data/repos/car_repo_implementation.dart';

import 'add_car_states.dart';

class AddCarCubit extends Cubit<AddCarStates> {

  AddCarCubit(this.repo) :
        super(AddCarInitialState());

  final CarRepoImplementation repo;
  static AddCarCubit get (context) => BlocProvider.of(context);


  Future<void> addCar ({
  required CarModel car
  }) async
  {
    emit(AddCarLoadingState());
    var response = await repo.add(
      car: car
    );
    response.fold((failure)
    {
      emit(AddCarErrorState(failure.errorMessage));
    }, (result)
    {
      emit(AddCarSuccessState());
    });
  }
}