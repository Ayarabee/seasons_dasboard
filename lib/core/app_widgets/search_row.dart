import 'package:flutter/material.dart';

import '../../features/users/presentation/admin_users/presentation/views/widgets/drop_down.dart';
import '../../features/users/presentation/admin_users/presentation/views/widgets/search_textform.dart';
import '../resources_manager/colors_manager.dart';
import 'AddButton.dart';

class SearchRow extends StatelessWidget {
  const SearchRow(
      {Key? key,
      required this.onTap,
      required this.controller,
      required this.text,
      this.showArrows = true ,
      })
      : super(key: key);
  final Function() onTap;
  final TextEditingController controller;
  final String text;
  final bool showArrows;
  @override
  Widget build(BuildContext context) {
    final List<String> _dropdownItems = [
      '10',
      '25',
      '50',
      '100',
    ];
    return Column(
      children: [
        Row(
          children: [

            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20.0),
              child: AddButton(
                text: text,
                onTap: onTap,
                color: ColorsManager.primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const Text("Show"),
            const SizedBox(
              width: 8,
            ),
            MyDropdown(
              list: _dropdownItems,
              inner: false,
              width: 70,
              height: 40,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text("entries"),
            const Spacer(),
            if (showArrows)
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: ColorsManager.primaryColor,
                    )),
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: .2),
                  ),
                  child: const Center(
                    child: Text("1"),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: ColorsManager.primaryColor,
                    )),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 200,
              height: 45,
              child: TextFormSearch(
                text: 'Search',
                controller: controller,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
