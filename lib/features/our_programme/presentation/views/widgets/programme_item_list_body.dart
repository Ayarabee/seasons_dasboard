import 'package:flutter/material.dart';

import '../../../../../core/resources_manager/style_manager.dart';

class ProgrammeItemBodyListBody extends StatelessWidget {
  const ProgrammeItemBodyListBody(
      {Key? key, required this.programmeItemBodyList, required this.index})
      : super(key: key);
  final List<Map<String, dynamic>> programmeItemBodyList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "$index",
                style: StyleManager.drawerTextStyle
                    .copyWith(color: Colors.blueGrey),
              ),
              const SizedBox(
                width: 50,
              ),
              Text(
                programmeItemBodyList[index]['dest'],
                style: StyleManager.drawerTextStyle
                    .copyWith(color: Colors.blueGrey),
              ),
              const SizedBox(
                width: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    programmeItemBodyList[index]['title'],
                    style: StyleManager.drawerTextStyle
                        .copyWith(color: Colors.blueGrey),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        )
                    ],
                  ),
                  Text(
                    "Hotel",
                    style: StyleManager.drawerTextStyle
                        .copyWith(color: Colors.blueGrey),
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Text(
                programmeItemBodyList[index]['days'],
                style: StyleManager.drawerTextStyle
                    .copyWith(color: Colors.blueGrey),
              ),
              const SizedBox(
                width: 50,
              ),
              Text(
                programmeItemBodyList[index]['night'],
                style: StyleManager.drawerTextStyle
                    .copyWith(color: Colors.blueGrey),
              ),
              const SizedBox(
                width: 60,
              ),
              Text(
                programmeItemBodyList[index]['departure'],
                style: StyleManager.drawerTextStyle
                    .copyWith(color: Colors.blueGrey),
              ),
              const SizedBox(
                width: 35,
              ),
              Text(
                programmeItemBodyList[index]['return'],
                style: StyleManager.drawerTextStyle
                    .copyWith(color: Colors.blueGrey),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                programmeItemBodyList[index]['flight'],
                style: StyleManager.drawerTextStyle
                    .copyWith(color: Colors.blueGrey),
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                programmeItemBodyList[index]['car'],
                style: StyleManager.drawerTextStyle
                    .copyWith(color: Colors.blueGrey),
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                programmeItemBodyList[index]['available'],
                style: StyleManager.drawerTextStyle
                    .copyWith(color: Colors.blueGrey),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
              )
            ],
          ),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 95,
                height: 35,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.redAccent,
                  child: Text(
                    "Not Available",
                    style: StyleManager.textStyle2.copyWith(fontSize: 13),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
