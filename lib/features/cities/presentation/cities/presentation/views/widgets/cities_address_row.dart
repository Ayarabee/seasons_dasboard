import 'package:flutter/material.dart';

import '../../../../../../../core/resources_manager/style_manager.dart';


class CitiesAddressRow extends StatelessWidget {
  const CitiesAddressRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "#",
          style: StyleManager.drawerTextStyle.copyWith(color: Colors.blueGrey),
        ),
        Text(
          "City Name",
          style: StyleManager.drawerTextStyle.copyWith(color: Colors.blueGrey),
        ),
        Text(
          "City Name Eng",
          style: StyleManager.drawerTextStyle.copyWith(color: Colors.blueGrey),
        ),
        Text(
          "Country Name",
          style: StyleManager.drawerTextStyle.copyWith(color: Colors.blueGrey),
        ),
        Text(
          "Country Name Eng",
          style: StyleManager.drawerTextStyle.copyWith(color: Colors.blueGrey),
        ),
        Text(
          "Tools",
          style: StyleManager.drawerTextStyle.copyWith(color: Colors.blueGrey),
        ),
      ],
    );
  }
}
