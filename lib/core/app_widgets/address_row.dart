import 'package:flutter/material.dart';
import 'package:seasons_dashboard/features/hotels/presentation/views/hotels_view.dart';

import '../resources_manager/style_manager.dart';

class AddressRow extends StatelessWidget {
  const AddressRow({Key? key, required this.addressList}) : super(key: key);
  final List<String> addressList;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int i = 0; i < addressList.length; i++)
          Text(
            addressList[i],
            style:
                StyleManager.drawerTextStyle.copyWith(color: Colors.blueGrey),
          ),
      ],
    );
  }
}


