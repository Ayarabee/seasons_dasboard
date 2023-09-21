import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../../../core/app_cubit/app_states.dart';


class MyDropdown extends StatefulWidget {
  const MyDropdown({
    super.key,
    required this.list,
    required this.width,
    required this.height,
    required this.inner,
  });

  final List<String> list;
  final double width;
  final double height;
  final bool inner;

  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  late String _selectedItem;

  @override
  void initState() {
    _selectedItem = widget.list[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Container(
          width: widget.width,
          height: widget.height,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              borderRadius:
                  widget.inner ? BorderRadius.zero : BorderRadius.circular(5),
              border: Border.all(
                  color: Colors.black, width: widget.inner ? .2 : .4)),
          child: Center(
            child: DropdownButton<String>(
              value: _selectedItem,
              onChanged: (newValue) {
                setState(() {
                  _selectedItem = newValue!;
                  print("tttttttttttttttttttttappped");
                  print(_selectedItem);
                  cubit.checkIfAgent(_selectedItem);
                });
              },
              style: const TextStyle(fontSize: 14, color: Colors.black),
              icon: Padding(
                padding: widget.inner
                    ? const EdgeInsets.only(left: 50.0)
                    : EdgeInsets.zero,
                child: const Icon(
                  Icons.arrow_drop_down_outlined,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              underline: const SizedBox(),
              items: widget.list.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
