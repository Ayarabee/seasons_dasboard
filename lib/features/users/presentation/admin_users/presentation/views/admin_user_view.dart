import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/users/presentation/admin_users/presentation/views/widgets/admin_user_body.dart';
import 'package:seasons_dashboard/features/users/presentation/admin_users/presentation/views/widgets/itemList.dart';

import '../../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../../core/app_cubit/app_states.dart';
import '../../../../../../core/app_widgets/address_row.dart';
import '../../../../../../core/app_widgets/search_row.dart';


class AdminUserView extends StatelessWidget {
  const AdminUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

          if(cubit.addNewIndex == 0) {
            return cubit.addNewScreens[0];
          }

          else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchRow(
                  onTap: () {
                    cubit.addNewTapped(0);
                  },
                  controller: searchController,
                  text: "Add New Uses",
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 1,
                  color: Colors.black54,
                ),
                const SizedBox(
                  height: 15,
                ),
                const AdminUserBody(),
                const SizedBox(
                  height: 30,
                ),
              ],
            );
          }
      },
    );
  }
}
