import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/car/presentation/cubit/view_cars_cubit/view_cars_cubit.dart';
import 'package:seasons_dashboard/features/car/presentation/cubit/view_cars_cubit/view_cars_states.dart';
import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_states.dart';
import '../../../../core/app_widgets/address_row.dart';
import '../../../../core/app_widgets/search_row.dart';
import '../cubit/car_types_cubit/car_types_cubit.dart';
import '../cubit/car_types_cubit/car_types_states.dart';
import 'widgets/car_typr_view_body.dart';

class CarTypeView extends StatelessWidget {
  const CarTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          if(cubit.addNewIndex == 12) {
            return cubit.addNewScreens[12];
          }
          else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                SearchRow(
                  onTap: () {
                    cubit.addNewTapped(12);
                  },
                  controller: searchController,
                  text: "Add New Car Type",
                ),
                const SizedBox(
                  height: 30,
                ),
                const CarTypeViewBody(),

                const SizedBox(
                  height: 30,
                ),

              ],
            );


          }
        });

  }
}

