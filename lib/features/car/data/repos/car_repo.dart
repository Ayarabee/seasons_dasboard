import 'package:dartz/dartz.dart';
import 'package:seasons_dashboard/features/car/data/models/car_model.dart';
import 'package:seasons_dashboard/features/car/data/models/car_operation_response.dart';
import 'package:seasons_dashboard/features/countries/data/models/country_model.dart';
import 'package:seasons_dashboard/features/countries/data/models/country_operation_response.dart';

import '../../../../core/errors/failures.dart';

abstract class CarRepo
{

  Future<Either<Failure, List<CarModel>>> get();

  Future<Either<Failure, CarOperationResponse>>
  delete({required String id});

  Future<Either<Failure, CarOperationResponse>>
  add({required CarModel car});

  Future<Either<Failure, CarOperationResponse>>
  edit({required CarModel car});

  Future<Either<Failure, CarOperationResponse>>
  status({required String id, required String status,});
}