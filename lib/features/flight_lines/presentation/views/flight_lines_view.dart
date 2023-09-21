import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/flight_lines/presentation/views/widgets/flight_line_body.dart';

import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_states.dart';
import '../../../../core/app_widgets/AddButton.dart';
import '../../../../core/resources_manager/colors_manager.dart';

class FlightLinesView extends StatelessWidget {
  const FlightLinesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FlightLine> flights =
    [
      FlightLine(lineLogo: 'lineLogo', lineArabicName: 'lineArabicName', lineEnglishName: 'lineEnglishName'),
      FlightLine(lineLogo: 'lineLogo', lineArabicName: 'lineArabicName', lineEnglishName: 'lineEnglishName'),
      FlightLine(lineLogo: 'lineLogo', lineArabicName: 'lineArabicName', lineEnglishName: 'lineEnglishName'),
      FlightLine(lineLogo: 'lineLogo', lineArabicName: 'lineArabicName', lineEnglishName: 'lineEnglishName'),
    ];
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          if(cubit.addNewIndex == 8) {
            return cubit.addNewScreens[8];
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
                      text: 'Add New Flight Line',
                      onTap: ()
                      {
                        AppCubit.get(context).addNewTapped(8);

                      },
                      color: ColorsManager.primaryColor,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  AddressRow5(
                    flightLines: flights,
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
