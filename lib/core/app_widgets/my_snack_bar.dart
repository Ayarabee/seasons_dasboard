
import 'package:flutter/material.dart';

import '../resources_manager/colors_manager.dart';
import '../resources_manager/style_manager.dart';



void callMySnackBar({required context, required String text})
{
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text,style: const TextStyle(
        fontFamily: 'Cairo',
        color: ColorsManager.primaryColor,
        fontSize: 15,
        fontWeight: FontWeight.w600,

      )),
      duration:const Duration(seconds: 1) ,
    ),

  );
}