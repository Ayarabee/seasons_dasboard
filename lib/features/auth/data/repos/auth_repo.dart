import 'package:dartz/dartz.dart';
import 'package:seasons_dashboard/core/core_models/default_response.dart';
import 'package:seasons_dashboard/features/cities/data/models/city_model.dart';
import 'package:seasons_dashboard/features/cities/data/models/city_operation_response.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepo
{

  static String? email;

  Future<Either<Failure, DefaultResponse>>
  login ({
    required String email,
    required String password
  });

  Future<Either<Failure, DefaultResponse>>
  forget({
    required String email
  });

  Future<Either<Failure, DefaultResponse>>
  confirm({
    required String code,
  });

  Future<Either<Failure, DefaultResponse>>
  reset({
    required String password
  });
}