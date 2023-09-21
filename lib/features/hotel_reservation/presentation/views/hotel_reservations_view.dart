import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/hotel_reservation/presentation/views/widgets/hotel_res_body.dart';

import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_states.dart';

class HotelReservations extends StatelessWidget {
  const HotelReservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<HotelRes> hotelsRes =
    [
      HotelRes(hotelName: 'hotelName', roomType: 'roomType', firstName: 'firstName', lastName: 'lastName', daysCount: 'daysCount', total: 'total', createdBy: 'createdBy'),
      HotelRes(hotelName: 'hotelName', roomType: 'roomType', firstName: 'firstName', lastName: 'lastName', daysCount: 'daysCount', total: 'total', createdBy: 'createdBy'),
      HotelRes(hotelName: 'hotelName', roomType: 'roomType', firstName: 'firstName', lastName: 'lastName', daysCount: 'daysCount', total: 'total', createdBy: 'createdBy'),
      HotelRes(hotelName: 'hotelName', roomType: 'roomType', firstName: 'firstName', lastName: 'lastName', daysCount: 'daysCount', total: 'total', createdBy: 'createdBy'),
      HotelRes(hotelName: 'hotelName', roomType: 'roomType', firstName: 'firstName', lastName: 'lastName', daysCount: 'daysCount', total: 'total', createdBy: 'createdBy'),
    ];
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          if(cubit.addNewIndex == 6) {
            return cubit.addNewScreens[6];
          }
          else {
            return
              Column(
                children: [
                  const Text('Only current reservations that are still in progress are shown',
                  style: TextStyle(fontSize: 22, color: Colors.blueGrey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AddressRow3(
                      hotels: hotelsRes
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
