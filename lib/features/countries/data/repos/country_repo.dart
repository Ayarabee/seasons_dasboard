import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:seasons_dashboard/features/countries/data/models/country_model.dart';
import 'package:seasons_dashboard/features/countries/data/models/country_operation_response.dart';

import '../../../../core/errors/failures.dart';
import '../models/country_edit_response.dart';

abstract class CountryRepo
{

  Future<Either<Failure, List<CountryModel>>> get();
  Future<Either<Failure, CountryOperationResponse>> delete({required String id});
  Future<Either<Failure, CountryOperationResponse>>
  add({
    required String arName,
    required String enName,
    required Uint8List? flag
  });
  Future<Either<Failure, CountryEditResponse>> edit({required CountryModel country});
}