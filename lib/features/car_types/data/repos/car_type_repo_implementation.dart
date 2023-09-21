
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:seasons_dashboard/core/dio_helper/dio_helper.dart';
import 'package:seasons_dashboard/core/dio_helper/end_points.dart';
import 'package:seasons_dashboard/core/errors/failures.dart';
import '../models/car_type_model.dart';
import '../models/car_type_operation_response.dart';
import 'car_type_repo.dart';

class CarTypeRepoImplementation extends CarTypeRepo
{

  @override
  Future<Either<Failure, List<CarTypeModel>>>
  get() async
  {
    try {
      var data = await DioHelper.getDate(
        endPoint: EndPoints.viewCarTypes,
      );
      print(data.data.toString());
      List<CarTypeModel> carTypes=[];
      data.data.forEach((element)
      {
        carTypes.add(CarTypeModel.fromJson(element));
      });
      return right(carTypes);
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
  Future<Either<Failure, CarTypeOperationResponse>>
  add({required CarTypeModel carType}) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.addCarType,
          query: carType.toJson()
      );
      print(data.data.toString());
      return right(CarTypeOperationResponse.fromJson(data.data));
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
  Future<Either<Failure, CarTypeOperationResponse>>
  delete({required String id}) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.deleteCarType,
          query:
          {
            'id': id,
          }
      );
      print(data.data.toString());
      return right(CarTypeOperationResponse.fromJson(data.data));
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
  Future<Either<Failure, CarTypeOperationResponse>>
  edit({ required CarTypeModel carType}) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.editCarType,
          query: carType.toJson()
      );
      print(data.data.toString());
      return right(CarTypeOperationResponse.fromJson(data.data));
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