
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:seasons_dashboard/core/dio_helper/dio_helper.dart';
import 'package:seasons_dashboard/core/dio_helper/end_points.dart';
import 'package:seasons_dashboard/core/errors/failures.dart';
import 'package:seasons_dashboard/features/countries/data/models/country_model.dart';
import 'package:seasons_dashboard/features/countries/data/models/country_operation_response.dart';
import '../models/country_edit_response.dart';
import 'country_repo.dart';

class CountryRepoImplementation extends CountryRepo
{

  @override
  Future<Either<Failure, List<CountryModel>>>
  get() async
  {
    try {
      var data = await DioHelper.getDate(
          endPoint: EndPoints.viewCountries,
      );
      print(data.data.toString());
      List<CountryModel> countries=[];
      data.data.forEach((element)
      {
        countries.add(CountryModel.fromJson(element));
      });
      return right(countries);
    }
    catch (e) {
      print("object");
      print(e.toString());
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CountryOperationResponse>>
  add({
    required String arName,
    required String enName,
    required Uint8List? flag
  }) async
  {
    try {
      var data = await DioHelper.postDate(
        endPoint: EndPoints.addCountry,
          query:
          {
            'name': arName,
            'english_name' : enName,
            'flag' : MultipartFile.fromBytes(
                flag!,
                filename: 'first.jpg'
            )
          }
      );
      print(data.data.toString());
      return right(CountryOperationResponse.fromJson(data.data));
    }
    catch (e) {
      print(e.toString());
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CountryOperationResponse>>
  delete({
    required String id
  }) async
  {
    try {
      var data = await DioHelper.postDate(
        endPoint: EndPoints.deleteCountry,
          query:
          {
            'id': id,
          }
      );
      print(data.data.toString());
      return right(CountryOperationResponse.fromJson(data.data));
    }
    catch (e) {
      print(e.toString());
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CountryEditResponse>>
  edit({ required CountryModel country}) async
  {
    try {
      var data = await DioHelper.postDate(
        endPoint: EndPoints.editCountry,
          query: country.toJsonWithImage()
      );
      print(data.data.toString());
      return right(CountryEditResponse.fromJson(data.data));
    }
    catch (e) {
      print(e.toString());
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}