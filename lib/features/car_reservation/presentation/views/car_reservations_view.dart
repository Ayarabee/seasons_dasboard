import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_states.dart';
import '../../../../core/app_widgets/address_row.dart';
import '../../../../core/app_widgets/search_row.dart';

class CarReservations extends StatelessWidget {
  const CarReservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    List<String> carReservationsAddress = [];
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return cubit.addNewIndex == 5
            ? cubit.addNewScreens[5]
            : Expanded(
                child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SearchRow(
                      onTap: () {
                        cubit.addNewTapped(5);
                      },
                      controller: searchController,
                      text: "Add New Car",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AddressRow(
                      addressList: carReservationsAddress,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 1,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(),
                      separatorBuilder: (context, index) => const SizedBox(),
                      itemCount: 0,
                    ),
                  ],
                ),
              ));
      },
    );
  }
}
