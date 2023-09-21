import 'package:flutter/material.dart';

import '../resources_manager/colors_manager.dart';
import '../resources_manager/style_manager.dart';
import 'add_new_textform.dart';

class AddDataRow extends StatelessWidget {
  const AddDataRow(
      {Key? key,
      required this.controller,
      required this.name,
      required this.width})
      : super(key: key);
  final TextEditingController controller;
  final String name;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: StyleManager.drawerTextStyle
              .copyWith(color: ColorsManager.primaryColor),
        ),
        SizedBox(
          width: width,
        ),
        AddNewTextForm(
          controller: controller,
          height: 30,
          width: 300,
        ),
      ],
    );
  }
}
