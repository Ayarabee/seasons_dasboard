import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_states.dart';
import '../../../../core/app_widgets/add_data_row.dart';
import '../../../../core/app_widgets/add_image.dart';
import '../../../../core/app_widgets/next_button.dart';
import '../../../../core/resources_manager/style_manager.dart';

class NotificationCenterView extends StatelessWidget {
  const NotificationCenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notificationTitleController = TextEditingController();
    var notificationMessageController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Send Notification",
                  style: StyleManager.drawerTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 35,
                ),
                AddDataRow(
                  controller: notificationTitleController,
                  name: "Notification Title",
                  width: 60,
                ),
                const SizedBox(
                  height: 30,
                ),
                AddDataRow(
                    controller: notificationMessageController,
                    name: "Notification Message",
                    width: 30),
                const SizedBox(
                  height: 50,
                ),
                const AddImage(),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 150,
                  child: NextButton(
                    text: "Next",
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
