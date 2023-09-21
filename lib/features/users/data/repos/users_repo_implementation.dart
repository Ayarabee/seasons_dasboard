
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:seasons_dashboard/core/core_models/user_model.dart';
import 'package:seasons_dashboard/core/dio_helper/dio_helper.dart';
import 'package:seasons_dashboard/core/dio_helper/end_points.dart';
import 'package:seasons_dashboard/core/errors/failures.dart';
import 'package:seasons_dashboard/core/core_models/default_response.dart';

import 'users_repo.dart';

class UsersRepoImplementation extends UsersRepo
{

  @override
  Future<Either<Failure, List<UserModel>>>
  viewAll() async
  {
    try {
      var data = await DioHelper.getDate(
        endPoint: EndPoints.usersViewAll,
      );
      print(data.data.toString());
      List<UserModel> users=[];
      for(int i=0; i<data.data.length; i++)
      {
        users.add(UserModel.fromJson(data.data[i]));
      }
      // data.data.forEach((element)
      // {
      //   users.add(UserModel.fromJson(element));
      // });
      return right(users);
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
  Future<Either<Failure, DefaultResponse>>
  delete({required String id}) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.userDelete,
          query:
          {
            'id': id
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
  Future<Either<Failure, DefaultResponse>>
  add ({
    required UserModel userModel
  }) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.userAdd,
          query: userModel.toJsonWithImage()
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
  Future<Either<Failure, DefaultResponse>>
  edit({
    required UserModel userModel
  }) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.userEdit,
          query: userModel.toJson()
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