import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/car_repo_implementation.dart';
import 'view_cars_states.dart';


class ViewCarCubit extends Cubit<ViewCarsStates> {

  ViewCarCubit(this.repo) :
        super(ViewCarsInitialState());

  final CarRepoImplementation repo;
  static ViewCarCubit get (context) => BlocProvider.of(context);


  Future<void> getCars () async
  {
    emit(ViewCarsLoadingState());
    var response = await repo.get();

    response.fold((failure)
    {
      emit(ViewCarsErrorState(failure.errorMessage));
    }, (result)
    {
      emit(ViewCarsSuccessState(result));
    });
  }
}