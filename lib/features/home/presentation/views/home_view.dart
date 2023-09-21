import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/home/presentation/views/widgets/drawer_container.dart';
import 'package:seasons_dashboard/features/home/presentation/views/widgets/title_container.dart';

import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.blueGrey.shade50,
            appBar: AppBar(),
            body: BlocConsumer<AppCubit, AppStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = AppCubit.get(context);
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 0,
                            child: DrawerContainer(),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                const TitleContainer(),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.black45, width: .3),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: cubit.screensList[cubit.itemIndex],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
