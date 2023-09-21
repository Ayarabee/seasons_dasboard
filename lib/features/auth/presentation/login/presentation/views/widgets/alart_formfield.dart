import 'package:flutter/material.dart';

import '../../../../../../../core/resources_manager/style_manager.dart';


class AlertFormField extends StatelessWidget {
  const AlertFormField({
    Key? key,
    required this.controller,
    required this.height,
    required this.width,
    required this.hintText,
  }) : super(key: key);
  final TextEditingController controller;
  final double height;
  final double width;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        scrollPadding: EdgeInsets.zero,
        textAlign: TextAlign.start,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: StyleManager.textStyle2.copyWith(color: Colors.grey),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: .5,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: .5,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: .5,
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: .5,
            ),
          ),
        ),
      ),
    );
  }
}
