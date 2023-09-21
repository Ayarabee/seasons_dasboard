import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/core/app_cubit/app_cubit.dart';
import 'package:seasons_dashboard/core/app_cubit/app_states.dart';

import '../../../../../core/app_widgets/AddButton.dart';
import '../../../../../core/resources_manager/style_manager.dart';
import 'drawer_container.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Container(
          height: 120,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list[cubit.itemIndex]['text'],
                      style: StyleManager.textStyle1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const InkWell(
                          child: Text(
                            "HOME",
                            style: StyleManager.textStyle3,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.grey,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          list[cubit.itemIndex]['text'],
                          style: StyleManager.textStyle3.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        cubit.addNewIndex != -1
                            ? const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.grey,
                                size: 15,
                              )
                            : const SizedBox(),
                        cubit.addNewIndex != -1
                            ? const SizedBox(
                                width: 3,
                              )
                            : const SizedBox(),
                        cubit.addNewIndex != -1
                            ? Text(
                                cubit.addNewNames[cubit.addNewIndex],
                                style: StyleManager.textStyle3.copyWith(
                                  color: Colors.grey,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: AddButton(
                    onTap: () {},
                    text: "Open Main Site",
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
