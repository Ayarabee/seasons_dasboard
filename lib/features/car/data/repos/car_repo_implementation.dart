
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:seasons_dashboard/core/dio_helper/dio_helper.dart';
import 'package:seasons_dashboard/core/dio_helper/end_points.dart';
import 'package:seasons_dashboard/core/errors/failures.dart';
import 'package:seasons_dashboard/features/car/data/models/car_model.dart';
import 'package:seasons_dashboard/features/car/data/models/car_operation_response.dart';
import 'car_repo.dart';

class CarRepoImplementation extends CarRepo
{

  @override
  Future<Either<Failure, List<CarModel>>>
  get() async
  {
    try {
      var data = await DioHelper.getDate(
        endPoint: EndPoints.viewCars,
      );
      print(data.data.toString());
      List<CarModel> cars=[];
      data.data.forEach((element)
      {
        cars.add(CarModel.fromJson(element));
      });
      return right(cars);
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
  Future<Either<Failure, CarOperationResponse>>
  add({required CarModel car}) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.addCar,
          query: car.toJson()
      );
      print(data.data.toString());
      return right(CarOperationResponse.fromJson(data.data));
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
  Future<Either<Failure, CarOperationResponse>>
  delete({required String id}) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.deleteCar,
          query:
          {
            'id': id,
          }
      );
      print(data.data.toString());
      return right(CarOperationResponse.fromJson(data.data));
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
  Future<Either<Failure, CarOperationResponse>>
  edit({ required CarModel car}) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.editCar,
          query: car.toJson()
      );
      print(data.data.toString());
      return right(CarOperationResponse.fromJson(data.data));
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
  Future<Either<Failure, CarOperationResponse>>
  status({required String id, required String status}) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.statusCar,
          query:
          {
            'id' : id,
            'status' : status
          }
      );
      print(data.data.toString());
      return right(CarOperationResponse.fromJson(data.data));
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