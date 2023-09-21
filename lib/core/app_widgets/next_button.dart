import 'package:flutter/material.dart';

import '../resources_manager/colors_manager.dart';
import '../resources_manager/style_manager.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      color: ColorsManager.primaryColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: StyleManager.textStyle2,
      ),
    );
  }
}
