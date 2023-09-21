import 'package:flutter/material.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: .2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              InkWell(
                child: Icon(
                  Icons.arrow_drop_up_sharp,
                  size: 15,
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.arrow_drop_down_sharp,
                  size: 15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
