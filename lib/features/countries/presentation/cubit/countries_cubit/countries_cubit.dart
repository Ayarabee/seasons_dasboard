import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/countries/data/models/country_model.dart';
import 'package:seasons_dashboard/features/countries/data/repos/country_repo_implementation.dart';

import '../../../../../core/app_widgets/my_snack_bar.dart';
import 'countries_states.dart';

class CountriesCubit extends Cubit<CountriesStates> {

  CountriesCubit(this.repo) :
        super(CountriesInitialState());

  final CountryRepoImplementation repo;
  static CountriesCubit get (context) => BlocProvider.of(context);


  List<CountryModel> countries=[];
  Future<void> getCountries () async
  {
    countries=[];
    emit(ViewCountriesLoadingState());
    var response = await repo.get();

    response.fold((failure)
    {
      emit(ViewCountriesErrorState(failure.errorMessage));

    }, (result)
    {
      countries= result;
      emit(ViewCountriesSuccessState());
    });
  }


  Future<void> addCountry ({
    required context,
    required String arName,
    required String enName,
    required Uint8List? flag,
  }) async
  {
    emit(AddCountryLoadingState());
    var response = await repo.add(
        arName: arName,
        enName: enName,
        flag: flag
    );
    response.fold((failure)
    {
      emit(AddCountryErrorState(failure.errorMessage));
      callMySnackBar(context: context, text: failure.errorMessage);

    }, (result)async
    {
      if(result.success!) {
        emit(AddCountrySuccessState());
        callMySnackBar(context: context, text: result.message!);
        await getCountries();
      }
      else
      {
        emit(AddCountryErrorState(result.message!));
        callMySnackBar(context: context, text: result.message!);
      }
    });
  }


  Future<void> deleteCountry ({
    required context,
    required String id,
    required int index,
  }) async
  {
    emit(DeleteCountryLoadingState());
    var response = await repo.delete(
        id: id
    );
    response.fold((failure)
    {
      emit(DeleteCountryErrorState(failure.errorMessage));
      callMySnackBar(context: context, text: failure.errorMessage);

    }, (result) async
    {
      if(result.success!) {
        emit(DeleteCountrySuccessState());
        callMySnackBar(context: context, text: result.message!);
        countries.removeAt(index);
      }
      else
      {
        emit(DeleteCountryErrorState(result.message!));
        callMySnackBar(context: context, text: result.message!);
      }
    });
  }

  Future<void> editCountry ({
    required context,
    required CountryModel country
  }) async
  {
    emit(EditCountryLoadingState());
    var response = await repo.edit(
        country: country
    );
    response.fold((failure)
    {
      emit(EditCountryErrorState(failure.errorMessage));
      callMySnackBar(context: context, text: failure.errorMessage);

    }, (result)async
    {
      if(result.message == 'countries updated successfully') {
        emit(EditCountrySuccessState());
        callMySnackBar(context: context, text: result.message!);
        await getCountries();
      }
      else
      {
        emit(EditCountryErrorState(result.message!));
        callMySnackBar(context: context, text: result.message!);

      }
    });
  }
}