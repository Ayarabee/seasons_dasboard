import 'package:flutter/material.dart';

import '../../../../../../../core/resources_manager/style_manager.dart';


class LoginTextForm extends StatelessWidget {
  const LoginTextForm(
      {Key? key,
      required this.controller,
      required this.height,
      required this.width,
      required this.labelText,
      required this.icon})
      : super(key: key);
  final TextEditingController controller;
  final double height;
  final double width;
  final String labelText;
  final Icon icon;

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
          labelText: labelText,
          prefixIcon: icon,
          filled: true,
          fillColor: Colors.white24,
          labelStyle: StyleManager.textStyle2.copyWith(color: Colors.black38),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: .2),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: .2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: .2),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: .2),
          ),
        ),
      ),
    );
  }
}
