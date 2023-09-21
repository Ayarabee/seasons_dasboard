import 'package:get_it/get_it.dart';
import 'package:seasons_dashboard/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:seasons_dashboard/features/car_types/data/repos/car_type_repo_implementation.dart';
import 'package:seasons_dashboard/features/cities/data/repos/city_repo_implementation.dart';
import 'package:seasons_dashboard/features/users/data/repos/users_repo_implementation.dart';

import '../../features/car/data/repos/car_repo_implementation.dart';
import '../../features/countries/data/repos/country_repo_implementation.dart';

final getIt = GetIt.instance;

void setupForgotPassSingleton()
{
  getIt.registerSingleton<CountryRepoImplementation>(
      CountryRepoImplementation()
  );

  getIt.registerSingleton<AuthRepoImplementation>(
      AuthRepoImplementation()
  );

  getIt.registerSingleton<CarRepoImplementation>(
      CarRepoImplementation()
  );

  getIt.registerSingleton<CarTypeRepoImplementation>(
      CarTypeRepoImplementation()
  );

  getIt.registerSingleton<UsersRepoImplementation>(
      UsersRepoImplementation()
  );

  getIt.registerSingleton<CityRepoImplementation>(
      CityRepoImplementation()
  );

}