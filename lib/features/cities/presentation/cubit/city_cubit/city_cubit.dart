import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/cities/data/repos/city_repo_implementation.dart';

import '../../../../../core/app_widgets/my_snack_bar.dart';
import '../../../data/models/city_model.dart';
import 'city_states.dart';

class CityCubit extends Cubit<CityStates> {

  CityCubit(this.repo) :
        super(ViewCitiesInitialState());

  final CityRepoImplementation repo;
  static CityCubit get (context) => BlocProvider.of(context);


  List<CityModel> cities =[];
  Future<void> getCities () async
  {
    cities =[];
    emit(ViewCitiesLoadingState());
    var response = await repo.get();

    response.fold((failure)
    {
      emit(ViewCitiesErrorState(failure.errorMessage));
    }, (result)
    {
      cities =result;
      emit(ViewCitiesSuccessState(result));
    });
  }


  Future<void> addCity ({
    required context,
    required String arName,
    required String enName,
    required Uint8List? flag,
  }) async
  {
    emit(AddCityLoadingState());
    var response = await repo.add(
        arName: arName,
        enName: enName,
        flag: flag
    );
    response.fold((failure)
    {
      emit(AddCityErrorState(failure.errorMessage));
      callMySnackBar(context: context, text: failure.errorMessage);
    }, (result)async
    {
      if(result.success!)
      {
        emit(AddCitySuccessState());
        callMySnackBar(context: context, text: result.message!);
        await getCities();
      }
      else
      {
        emit(AddCityErrorState(result.message!));
        callMySnackBar(context: context, text: result.message!);
      }
    });
  }


  Future<void> deleteCity ({
    required context,
    required String id,
    required int index,
  }) async
  {
    emit(DeleteCityLoadingState());
    var response = await repo.delete(
        id: id
    );
    response.fold((failure)
    {
      emit(DeleteCityErrorState(failure.errorMessage));
      callMySnackBar(context: context, text: failure.errorMessage);
    }, (result)
    {
      if(result.success!) {
        cities.removeAt(index);
        emit(DeleteCitySuccessState());
        callMySnackBar(context: context, text: result.message!);
      }
      else
      {
        emit(DeleteCityErrorState(result.message!));
        callMySnackBar(context: context, text: result.message!);
      }
    });
  }

  Future<void> editCity ({
    required context,
    required CityModel city
  }) async
  {
    emit(EditCityLoadingState());
    var response = await repo.edit(
        city: city
    );
    response.fold((failure)
    {
      emit(EditCityErrorState(failure.errorMessage));
      callMySnackBar(context: context, text: failure.errorMessage);
    }, (result) async
    {
      if(result.success!) {
        emit(EditCitySuccessState());
        callMySnackBar(context: context, text: result.message!);
        await getCities();
      }
      else
      {
        emit(EditCityErrorState(result.message!));
        callMySnackBar(context: context, text: result.message!);
      }

    });
  }
}