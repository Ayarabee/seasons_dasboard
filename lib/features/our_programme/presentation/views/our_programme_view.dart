import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/our_programme/presentation/views/widgets/programme_item_list.dart';

import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_states.dart';
import '../../../../core/app_widgets/address_row.dart';
import '../../../../core/app_widgets/search_row.dart';

class OurProgrammeView extends StatelessWidget {
  const OurProgrammeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> ourProgrammeList = [
      "#",
      "Programme\nDestination",
      "Programme\nTitle",
      "Days\nCount",
      "Night\nCount",
      "Departure\nDate",
      "Return\nDate",
      "includes\nFlight",
      "Car\nType",
      "Is\nAvailable",
      "Tools",
    ];
    List<Map<String, dynamic>> ourProgramme = [
      {
        "dest": "Batumi",
        "title": "Hilton",
        "days": "8",
        "night": "7",
        "departure": "2023-05-11",
        "return": "2023-05-18",
        "flight": "Include\nFlight",
        "car": "bus",
        "available": "Available",
      }
    ];
    var searchController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return cubit.addNewIndex == 3
            ? cubit.addNewScreens[3]
            : Expanded(
                child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SearchRow(
                      onTap: () {
                        cubit.addNewTapped(3);
                      },
                      controller: searchController,
                      text: "Add New Programme",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AddressRow(
                      addressList: ourProgrammeList,
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
                      itemBuilder: (context, index) => ProgrammeItemList(
                        programmeItemList: ourProgramme,
                        index: index,
                      ),
                      separatorBuilder: (context, index) => const SizedBox(),
                      itemCount: ourProgramme.length,
                    ),
                  ],
                ),
              ));
      },
    );
  }
}
