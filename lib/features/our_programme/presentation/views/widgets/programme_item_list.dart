import 'package:flutter/material.dart';
import 'package:seasons_dashboard/features/our_programme/presentation/views/widgets/programme_item_list_body.dart';

class ProgrammeItemList extends StatelessWidget {
  const ProgrammeItemList(
      {Key? key, required this.programmeItemList, required this.index})
      : super(key: key);
  final List<Map<String, dynamic>> programmeItemList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: const EdgeInsets.all(20).copyWith(right: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: index % 2 == 0 ? Colors.white60 : Colors.grey[300],
      ),
      child: ProgrammeItemBodyListBody(
        programmeItemBodyList: programmeItemList,
        index: index,
      ),
    );
  }
}
