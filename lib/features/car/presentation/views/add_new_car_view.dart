import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_states.dart';
import '../../../../core/app_widgets/add_image.dart';
import '../../../../core/app_widgets/choose_row.dart';
import '../../../../core/app_widgets/next_button.dart';
import '../../../../core/resources_manager/colors_manager.dart';
import '../../../../core/resources_manager/style_manager.dart';
import '../../../users/presentation/admin_users/presentation/views/widgets/price_container.dart';

class AddNewCarView extends StatelessWidget {
  const AddNewCarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var priceController = TextEditingController();
    var priceDriverController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Add New Car",
                  style: StyleManager.drawerTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 35,
                ),
                const ChooseRow(
                  text: "Car Type",
                  chooseList: [
                    'sedan',
                    'van car',
                    'bus',
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Price per day",
                      style: StyleManager.drawerTextStyle
                          .copyWith(color: ColorsManager.primaryColor),
                    ),
                    const SizedBox(
                      width: 45,
                    ),
                    PriceContainer(
                      controller: priceController,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Price per Day With driver",
                      style: StyleManager.drawerTextStyle
                          .copyWith(color: ColorsManager.primaryColor),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    PriceContainer(
                      controller: priceDriverController,
                    ),
                  ],
                ),
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
