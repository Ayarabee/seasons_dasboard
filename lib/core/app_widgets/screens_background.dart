import 'package:flutter/material.dart';

import '../resources_manager/assets_manager.dart';

class ScreensBackground extends StatelessWidget {
  const ScreensBackground({Key? key, required this.child}) : super(key: key);
  final Scaffold child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AssetsManager.loginImage2,
            ),
            fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}
