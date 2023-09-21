import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/cities/presentation/cities/presentation/views/widgets/city_body.dart';

import '../../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../../core/app_cubit/app_states.dart';
import '../../../../../../core/app_widgets/AddButton.dart';
import '../../../../../../core/resources_manager/colors_manager.dart';


class CitiesView extends StatelessWidget {
  const CitiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return cubit.addNewIndex == 2
            ? cubit.addNewScreens[2]
            : Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    AddButton(
                      text: "Add New City",
                      onTap: () {
                        cubit.addNewTapped(2);
                      },
                      color: ColorsManager.primaryColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),

                const CityBody()

              ],
            ),
              );
      },
    );
  }
}
