import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:seasons_dashboard/features/cities/data/models/city_model.dart';
import 'package:seasons_dashboard/features/cities/data/models/city_operation_response.dart';

import '../../../../core/errors/failures.dart';
import '../models/city_edit_response.dart';

abstract class CityRepo
{

  Future<Either<Failure, List<CityModel>>> get();
  Future<Either<Failure, CityOperationResponse>> delete({required String id});
  Future<Either<Failure, CityOperationResponse>>
  add({
    required String arName,
    required String enName,
    required Uint8List? flag,
  });
  Future<Either<Failure, CityEditResponse>> edit({required CityModel city});
}