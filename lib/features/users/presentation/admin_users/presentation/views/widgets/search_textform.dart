import 'package:flutter/material.dart';

import '../../../../../../../core/resources_manager/colors_manager.dart';
import '../../../../../../../core/resources_manager/style_manager.dart';


class TextFormSearch extends StatefulWidget {
  const TextFormSearch({Key? key, required this.text, required this.controller})
      : super(key: key);
  final String text;
  final TextEditingController controller;

  @override
  State<TextFormSearch> createState() => _TextFormSearchState();
}

bool enable = false;

class _TextFormSearchState extends State<TextFormSearch> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      scrollPadding: EdgeInsets.zero,
      textAlign: TextAlign.start,
      controller: widget.controller,
      textAlignVertical: TextAlignVertical.center,
      style: enable
          ? StyleManager.drawerTextStyle
              .copyWith(color: ColorsManager.primaryColor)
          : StyleManager.drawerTextStyle,
      onTap: () {
        setState(() {
          enable = true;
        });
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: widget.text,
        hintStyle: enable
            ? StyleManager.drawerTextStyle
                .copyWith(color: ColorsManager.primaryColor)
            : StyleManager.drawerTextStyle,
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: .2),
            borderRadius: BorderRadius.circular(5)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: .2),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorsManager.primaryColor, width: .2),
            borderRadius: BorderRadius.circular(5)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: .2),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
