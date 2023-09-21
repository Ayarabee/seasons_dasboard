
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:seasons_dashboard/core/dio_helper/dio_helper.dart';
import 'package:seasons_dashboard/core/dio_helper/end_points.dart';
import 'package:seasons_dashboard/core/errors/failures.dart';
import 'package:seasons_dashboard/features/cities/data/models/city_model.dart';
import 'package:seasons_dashboard/features/cities/data/models/city_operation_response.dart';
import '../models/city_edit_response.dart';
import 'city_repo.dart';

class CityRepoImplementation extends CityRepo
{

  @override
  Future<Either<Failure, List<CityModel>>>
  get() async
  {
    try {
      var data = await DioHelper.getDate(
          endPoint: EndPoints.viewCities,
      );
      print(data.data.toString());
      List<CityModel> cities=[];
      data.data.forEach((element)
      {
        cities.add(CityModel.fromJson(element));
      });
      return right(cities);
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
  Future<Either<Failure, CityOperationResponse>>
  add({
    required String arName,
    required String enName,
    required Uint8List? flag,
  }) async
  {
    try {
      var data = await DioHelper.postDate(
        endPoint: EndPoints.addCity,
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
      return right(CityOperationResponse.fromJson(data.data));
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
  Future<Either<Failure, CityOperationResponse>>
  delete({
    required String id
  }) async
  {
    try {
      var data = await DioHelper.postDate(
        endPoint: EndPoints.deleteCity,
          query:
          {
            'id': id,
          }
      );
      print(data.data.toString());
      return right(CityOperationResponse.fromJson(data.data));
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
  Future<Either<Failure, CityEditResponse>>
  edit({ required CityModel city}) async
  {
    try {
      var data = await DioHelper.postDate(
        endPoint: EndPoints.editCity,
          query: city.toJson()
      );
      print(data.data.toString());
      return right(CityEditResponse.fromJson(data.data));
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