import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/airports/presentation/views/widgets/airport_body.dart';

import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_states.dart';
import '../../../../core/app_widgets/AddButton.dart';
import '../../../../core/resources_manager/colors_manager.dart';

class AirportsView extends StatelessWidget {
  const AirportsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AirPort> airports =
    [
      AirPort(name: 'name', nameEn: 'nameEn'),
      AirPort(name: 'name', nameEn: 'nameEn'),
      AirPort(name: 'name', nameEn: 'nameEn'),
      AirPort(name: 'name', nameEn: 'nameEn'),
      AirPort(name: 'name', nameEn: 'nameEn'),
      AirPort(name: 'name', nameEn: 'nameEn'),
    ];
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          if(cubit.addNewIndex == 7) {
            return cubit.addNewScreens[7];
          }
          else {
            return
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20.0),
                    child: AddButton(
                      text: 'Add New Airport',
                      onTap: ()
                      {
                        AppCubit.get(context).addNewTapped(7);

                      },
                      color: ColorsManager.primaryColor,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  AddressRow4(
                      airports: airports,
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                ],
              );
          }
        });
  }
}
