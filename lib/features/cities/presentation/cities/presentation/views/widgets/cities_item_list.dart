import 'package:flutter/material.dart';

import '../../../../../../../core/resources_manager/style_manager.dart';

class CityItemList extends StatelessWidget {
  const CityItemList({Key? key, required this.list, required this.index})
      : super(key: key);
  final List<Map<String, dynamic>> list;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: index % 2 == 0 ? Colors.white60 : Colors.grey[300],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$index",
              style:
                  StyleManager.drawerTextStyle.copyWith(color: Colors.blueGrey),
            ),
            Text(
              list[index]['citynamear'],
              style:
                  StyleManager.drawerTextStyle.copyWith(color: Colors.blueGrey),
            ),
            Text(
              list[index]['citynameen'],
              style:
                  StyleManager.drawerTextStyle.copyWith(color: Colors.blueGrey),
            ),
            Text(
              list[index]['namear'],
              style:
                  StyleManager.drawerTextStyle.copyWith(color: Colors.blueGrey),
            ),
            Text(
              list[index]['nameen'],
              style:
                  StyleManager.drawerTextStyle.copyWith(color: Colors.blueGrey),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_outlined,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
