import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:seasons_dashboard/core/app_cubit/app_cubit.dart';
import 'package:seasons_dashboard/core/app_widgets/address_row.dart';
import 'package:seasons_dashboard/features/hotels/presentation/views/widgets/add_new_hotel.dart';
import 'package:seasons_dashboard/features/hotels/presentation/views/widgets/address_row2.dart';
import '../../../../core/app_cubit/app_states.dart';
import '../../../../core/app_widgets/search_row.dart';
import '../../../users/presentation/admin_users/presentation/views/widgets/itemList.dart';

class Hotels extends StatelessWidget {
  const Hotels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Hotel> hotels =
    [
      Hotel(name: 'name', nameEn: 'nameEn', type: 'type', rate: 'rate', city: 'city', isAvailable: 'isAvailable'),
      Hotel(name: 'name', nameEn: 'nameEn', type: 'type', rate: 'rate', city: 'city', isAvailable: 'isAvailable'),
      Hotel(name: 'name', nameEn: 'nameEn', type: 'type', rate: 'rate', city: 'city', isAvailable: 'isAvailable'),
      Hotel(name: 'name', nameEn: 'nameEn', type: 'type', rate: 'rate', city: 'city', isAvailable: 'isAvailable'),
      Hotel(name: 'name', nameEn: 'nameEn', type: 'type', rate: 'rate', city: 'city', isAvailable: 'isAvailable'),
    ];
    List<String> hotelDate =
    [
      '#',
      'Hotel Name',
      'Hotel Name English',
      'Hotel Type',
      'City',
      'Is Available ?',
      'Tools',
    ];
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
    builder: (context, state) {
      var cubit = AppCubit.get(context);
      if(cubit.addNewIndex == 5) {
        return cubit.addNewScreens[5];
      }
      else {
        return
      Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SearchRow(
            showArrows: false,
            onTap: () {
              AppCubit.get(context).addNewTapped(5);
            },
            controller: TextEditingController(),
            text: "Add New Hotels",
          ),
          const SizedBox(
            height: 30,
          ),
          AddressRow2(
              addressList: hotelDate,
              hotels: hotels
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

