import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/core/app_cubit/app_cubit.dart';
import 'package:seasons_dashboard/core/app_cubit/app_states.dart';
import 'package:seasons_dashboard/core/app_widgets/AddButton.dart';
import 'package:seasons_dashboard/features/countries/presentation/countries/presentation/views/widgets/country_body.dart';

import '../../../../../../core/resources_manager/colors_manager.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return cubit.addNewIndex == 1
            ? cubit.addNewScreens[1]
            : Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    AddButton(
                      text: "Add New Country",
                      onTap: () {
                        cubit.addNewTapped(1);
                      },
                      color: ColorsManager.primaryColor,
                    ),
                  ],
                ),

                const SizedBox(
                  height: 15,
                ),
                const CountryBody()
              ],
            ),
              );
      },
    );
  }
}
