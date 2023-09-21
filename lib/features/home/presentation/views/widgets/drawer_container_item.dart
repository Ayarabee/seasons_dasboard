import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/car_types/presentation/cubit/car_types_cubit/car_types_cubit.dart';
import 'package:seasons_dashboard/features/cities/presentation/cubit/city_cubit/city_cubit.dart';
import 'package:seasons_dashboard/features/users/presentation/cubit/users_cubit/users_cubit.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/app_cubit/app_states.dart';
import '../../../../../core/resources_manager/colors_manager.dart';
import '../../../../../core/resources_manager/style_manager.dart';
import '../../../../car/presentation/cubit/view_cars_cubit/view_cars_cubit.dart';
import '../../../../countries/presentation/cubit/countries_cubit/countries_cubit.dart';

class Item extends StatelessWidget {
  const Item(
      {Key? key, required this.text, required this.icon, required this.index})
      : super(key: key);
  final String text;
  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return InkWell(
          onTap: () {
            if(index == 1)
            {
              UsersCubit.get(context).viewAll();
            }
            else if(index == 4)
            {
              ViewCarCubit.get(context).getCars();
            }
            else if(index == 13)
            {
              CountriesCubit.get(context).getCountries();
            }
            else if(index == 14)
            {
              CityCubit.get(context).getCities();
              CountriesCubit.get(context).getCountries();
            }
            else if(index == 17)
            {
              CarTypeCubit.get(context).getCarTypes();
            }
            cubit.changeScreen(index);
          },
          child: Container(
            decoration: BoxDecoration(
                color: cubit.tapped && index == cubit.itemIndex
                    ? ColorsManager.secondaryColor
                    : Colors.grey[100],
                borderRadius: BorderRadius.circular(5)),
            height: 50,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: cubit.tapped && index == cubit.itemIndex
                          ? Colors.white
                          : Colors.grey,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      text,
                      style: cubit.tapped && index == cubit.itemIndex
                          ? StyleManager.drawerTextStyle
                              .copyWith(color: Colors.white)
                          : StyleManager.drawerTextStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
