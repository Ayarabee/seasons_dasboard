import 'package:flutter/material.dart';

import '../resources_manager/colors_manager.dart';
import '../resources_manager/style_manager.dart';

class AddNewTextForm extends StatelessWidget {
  const AddNewTextForm(
      {Key? key,
      required this.controller,
      required this.height,
      required this.width})
      : super(key: key);
  final TextEditingController controller;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        scrollPadding: EdgeInsets.zero,
        textAlign: TextAlign.center,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        style: StyleManager.drawerTextStyle
            .copyWith(color: ColorsManager.primaryColor),
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: .2),
              borderRadius: BorderRadius.circular(4)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: .2),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: ColorsManager.primaryColor, width: .2),
              borderRadius: BorderRadius.circular(4)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: .2),
              borderRadius: BorderRadius.circular(4)),
        ),
      ),
    );
  }
}
