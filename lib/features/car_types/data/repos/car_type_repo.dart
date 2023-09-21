import 'package:dartz/dartz.dart';

import 'package:seasons_dashboard/features/car_types/data/models/car_type_model.dart';
import 'package:seasons_dashboard/features/car_types/data/models/car_type_operation_response.dart';
import '../../../../core/errors/failures.dart';

abstract class CarTypeRepo
{

  Future<Either<Failure, List<CarTypeModel>>> get();

  Future<Either<Failure, CarTypeOperationResponse>>
  delete({required String id});

  Future<Either<Failure, CarTypeOperationResponse>>
  add({required CarTypeModel carType});

  Future<Either<Failure, CarTypeOperationResponse>>
  edit({required CarTypeModel carType});

}