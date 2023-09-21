import 'package:flutter/material.dart';

import 'colors_manager.dart';

abstract class StyleManager {
  static const TextStyle bookTypeTitle = TextStyle(
    //fontWeight: FontWeight.w600,
    fontSize: 20,
    color: Colors.blueGrey,
    fontFamily: 'Cairo',
  );
  static const TextStyle bookAboveInput = TextStyle(
    //fontWeight: FontWeight.w600,
    fontSize: 15,
    color: Colors.blueGrey,
    fontFamily: 'Cairo',
  );
  static const TextStyle defaultButton = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13,
    color: Colors.white,
    fontFamily: 'Cairo',
  );
  static const TextStyle bookInputField = TextStyle(
    //fontWeight: FontWeight.w600,
    fontSize: 13,
    color: Colors.blueGrey,
    fontFamily: 'Cairo',
  );
  static const TextStyle appBarTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.white,
  );
  static const TextStyle drawerTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: Colors.black54,
  );
  static const TextStyle textStyle1 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: ColorsManager.primaryColor,
  );
  static const TextStyle textStyle2 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: Colors.white,
  );

  static const TextStyle textStyle3 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: ColorsManager.primaryColor,
  );
}
