
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:seasons_dashboard/core/app_cubit/app_cubit.dart';
import 'package:seasons_dashboard/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:seasons_dashboard/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:seasons_dashboard/features/car/presentation/cubit/add_car_cubit/add_car_cubit.dart';
import 'package:seasons_dashboard/features/car/presentation/cubit/change_status_cubit/change_status_cubit.dart';
import 'package:seasons_dashboard/features/car/presentation/cubit/delete_car_cubit/delete_car_cubit.dart';
import 'package:seasons_dashboard/features/car/presentation/cubit/edit_car_cubit/edit_car_cubit.dart';
import 'package:seasons_dashboard/features/car/presentation/cubit/view_cars_cubit/view_cars_cubit.dart';
import 'package:seasons_dashboard/features/cities/data/repos/city_repo_implementation.dart';
import 'package:seasons_dashboard/features/home/presentation/views/home_view.dart';
import 'core/dio_helper/dio_helper.dart';
import 'core/local_database/cache_helper.dart';
import 'core/service_locator/service_locator.dart';
import 'features/car/data/repos/car_repo_implementation.dart';
import 'features/car_types/data/repos/car_type_repo_implementation.dart';
import 'features/car_types/presentation/cubit/car_types_cubit/car_types_cubit.dart';
import 'features/cities/presentation/cubit/city_cubit/city_cubit.dart';
import 'features/countries/data/repos/country_repo_implementation.dart';
import 'features/countries/presentation/cubit/countries_cubit/countries_cubit.dart';
import 'features/users/data/repos/users_repo_implementation.dart';
import 'features/users/presentation/cubit/users_cubit/users_cubit.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  setupForgotPassSingleton();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers:
      [
        //users
        BlocProvider(create: (BuildContext context) =>
            UsersCubit(getIt.get<UsersRepoImplementation>())),

        // car
        BlocProvider(create: (BuildContext context) =>
            ViewCarCubit(getIt.get<CarRepoImplementation>())),
        BlocProvider(create: (BuildContext context) =>
            DeleteCarCubit(getIt.get<CarRepoImplementation>())),
        BlocProvider(create: (BuildContext context) =>
            AddCarCubit(getIt.get<CarRepoImplementation>())),
        BlocProvider(create: (BuildContext context) =>
            EditCarCubit(getIt.get<CarRepoImplementation>())),
        BlocProvider(create: (BuildContext context) =>
            ChangeStatusCubit(getIt.get<CarRepoImplementation>())),

        // car type
        BlocProvider(create: (BuildContext context) =>
            CarTypeCubit(getIt.get<CarTypeRepoImplementation>())),

        
        BlocProvider(create: (BuildContext context) =>
            CountriesCubit(getIt.get<CountryRepoImplementation>())),

        BlocProvider(create: (BuildContext context) =>
            CityCubit(getIt.get<CityRepoImplementation>())),

        BlocProvider(create: (BuildContext context) =>
            LoginCubit(getIt.get<AuthRepoImplementation>())),

        BlocProvider(create: (BuildContext context) =>
        AppCubit())
      ],
      child:  GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'Cairo'
        ),
          debugShowCheckedModeBanner: false,
          home: const HomeView()
      ),
    );
  }
}