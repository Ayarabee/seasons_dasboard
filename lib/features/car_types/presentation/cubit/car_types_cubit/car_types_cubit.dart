import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/car_types/data/models/car_type_model.dart';

import '../../../../../core/app_widgets/my_snack_bar.dart';
import '../../../data/repos/car_type_repo_implementation.dart';
import 'car_types_states.dart';


class CarTypeCubit extends Cubit<CarTypesStates> {

  CarTypeCubit(this.repo) :
        super(CarTypesInitialState());

  final CarTypeRepoImplementation repo;
  static CarTypeCubit get (context) => BlocProvider.of(context);

  List<CarTypeModel> carTypes=[];
  Future<void> getCarTypes () async
  {
    carTypes=[];
    emit(ViewCarTypesLoadingState());
    var response = await repo.get();

    response.fold((failure)
    {
      emit(ViewCarTypesErrorState(failure.errorMessage));
    }, (result)
    {
      carTypes = result;
      emit(ViewCarTypesSuccessState());
    });
  }

  Future<void> editCarType ({
    required context,
    required CarTypeModel carType
  }) async
  {
    emit(EditCarTypeLoadingState());
    var response = await repo.edit(
        carType: carType
    );
    response.fold((failure)
    {
      emit(EditCarTypeErrorState(failure.errorMessage));
      callMySnackBar(context: context, text: failure.errorMessage);
    }, (result) async
    {
      emit(EditCarTypeSuccessState());
      callMySnackBar(context: context, text: 'Edit Success');
      await getCarTypes();
    });
  }


  Future<void> deleteCarType ({
    required context,
    required String id,
  }) async
  {
    emit(DeleteCarTypeLoadingState());
    var response = await repo.delete(
        id: id
    );
    response.fold((failure)
    {
      emit(DeleteCarTypeErrorState(failure.errorMessage));
      callMySnackBar(context: context, text: failure.errorMessage);
    }, (result) async
    {
      emit(DeleteCarTypeSuccessState());
      callMySnackBar(context: context, text: 'Deleted Success');
      await getCarTypes();
    });
  }

  Future<void> addCarType ({
    required context,
    required CarTypeModel carType
  }) async
  {

    emit(AddCarTypeLoadingState());
    var response = await repo.add(
        carType: carType
    );
    response.fold((failure)
    {
      emit(AddCarTypeErrorState(failure.errorMessage));
      callMySnackBar(context: context, text: failure.errorMessage);
    }, (result) async
    {
      emit(AddCarTypeSuccessState());
      callMySnackBar(context: context, text: 'Add Success');
      await getCarTypes();

    });
  }
}