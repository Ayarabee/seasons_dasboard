import 'package:flutter/material.dart';

import '../../../../../core/resources_manager/style_manager.dart';

class AddButton extends StatelessWidget {
  const AddButton(
      {Key? key, required this.onTap, required this.text, required this.color})
      : super(key: key);
  final Function() onTap;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      height: 45,
      color: color,
      child: Text(
        text,
        style: StyleManager.textStyle2,
      ),
    );
  }
}
