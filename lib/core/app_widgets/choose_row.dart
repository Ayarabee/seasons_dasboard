import 'package:flutter/material.dart';

import '../../features/users/presentation/admin_users/presentation/views/widgets/drop_down.dart';
import '../resources_manager/colors_manager.dart';
import '../resources_manager/style_manager.dart';

class ChooseRow extends StatelessWidget {
  const ChooseRow({Key? key, required this.text, required this.chooseList})
      : super(key: key);
  final String text;
  final List<String> chooseList;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: StyleManager.drawerTextStyle
              .copyWith(color: ColorsManager.primaryColor),
        ),
        const SizedBox(
          width: 60,
        ),
        MyDropdown(
          list: chooseList,
          inner: true,
          height: 30,
          width: 300,
        ),
      ],
    );
  }
}
