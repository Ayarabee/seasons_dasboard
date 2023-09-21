import 'package:dartz/dartz.dart';
import 'package:seasons_dashboard/core/core_models/user_model.dart';
import 'package:seasons_dashboard/core/core_models/default_response.dart';
import 'package:seasons_dashboard/features/cities/data/models/city_model.dart';
import 'package:seasons_dashboard/features/cities/data/models/city_operation_response.dart';

import '../../../../core/errors/failures.dart';

abstract class UsersRepo
{
  Future<Either<Failure, List<UserModel>>>
  viewAll ();

  Future<Either<Failure, DefaultResponse>>
  delete({
    required String id
  });

  Future<Either<Failure, DefaultResponse>>
  edit({
    required UserModel userModel
  });

  Future<Either<Failure, DefaultResponse>>
  add({
    required UserModel userModel
  });
}