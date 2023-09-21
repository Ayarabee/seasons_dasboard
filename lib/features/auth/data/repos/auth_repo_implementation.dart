
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:seasons_dashboard/core/dio_helper/dio_helper.dart';
import 'package:seasons_dashboard/core/dio_helper/end_points.dart';
import 'package:seasons_dashboard/core/errors/failures.dart';
import 'package:seasons_dashboard/core/core_models/default_response.dart';
import 'package:seasons_dashboard/features/cities/data/models/city_model.dart';
import 'package:seasons_dashboard/features/cities/data/models/city_operation_response.dart';
import 'auth_repo.dart';

class AuthRepoImplementation extends AuthRepo
{

  @override
  Future<Either<Failure, DefaultResponse>> login({required String email, required String password}) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.userLogin,
          query:
          {
            'email': email,
            'password': password,
          }
      );
      print(data.data.toString());
      return right(DefaultResponse.fromJson(data.data));
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
  Future<Either<Failure, DefaultResponse>> forget({required String email}) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.userForget,
          query:
          {
            'email': email,
          }
      );
      print(data.data.toString());
      return right(DefaultResponse.fromJson(data.data));
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
  Future<Either<Failure, DefaultResponse>> confirm({ required String code}) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.userConfirm,
          query:
          {
            'email': AuthRepo.email,
            'code': code,
          }
      );
      print(data.data.toString());
      return right(DefaultResponse.fromJson(data.data));
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
  Future<Either<Failure, DefaultResponse>> reset({required String password}) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.userReset,
          query:
          {
            'email': AuthRepo.email,
            'password': password,
          }
      );
      print(data.data.toString());
      return right(DefaultResponse.fromJson(data.data));
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