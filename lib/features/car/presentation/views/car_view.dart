import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/car/presentation/cubit/view_cars_cubit/view_cars_cubit.dart';
import 'package:seasons_dashboard/features/car/presentation/cubit/view_cars_cubit/view_cars_states.dart';

import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_states.dart';
import '../../../../core/app_widgets/search_row.dart';
import 'widgets/car_view_body.dart';

class CarView extends StatelessWidget {
  const CarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> carAddressList = [
      "#",
      "Car Type",
      "Price per day",
      "Is available ?",
      "Tools",
    ];
    List<Map<String, dynamic>> carList = [
      {
        "type": "sedan",
        "price": "80.00",
        "available": "Available",
      },
      {
        "type": "van car",
        "price": "100.00",
        "available": "Available",
      },
      {
        "type": "bus",
        "price": "150.00",
        "available": "Available",
      },
      {
        "type": "bus",
        "price": "220.00",
        "available": "Available",
      },
    ];
    var searchController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          if(cubit.addNewIndex == 4) {
            return cubit.addNewScreens[4];
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
                    cubit.addNewTapped(4);
                  },
                  controller: searchController,
                  text: "Add New Car",
                ),
                const SizedBox(
                  height: 30,
                ),

                BlocConsumer<ViewCarCubit, ViewCarsStates>(
                    builder: (context, state)
                    {
                      if (state is ViewCarsSuccessState) {
                        return CarViewBody(
                          cars: state.cars,
                        );
                      }
                      else if (state is ViewCarsLoadingState)
                      {
                        return const Center( child: CircularProgressIndicator(),);
                      }
                      else if (state is  ViewCarsErrorState)
                      {
                        return Center( child: Text(state.error, style: const TextStyle(color: Colors.red),));
                      }
                      else {
                        return SizedBox();
                      }
                    },
                    listener: (context, state){}
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

