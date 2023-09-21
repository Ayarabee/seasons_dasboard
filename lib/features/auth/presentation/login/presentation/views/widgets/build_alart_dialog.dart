import 'dart:core';

import 'package:flutter/material.dart';
import 'package:seasons_dashboard/core/resources_manager/style_manager.dart';


import '../../../../../../../core/app_widgets/AddButton.dart';
import '../../../../../../../core/resources_manager/colors_manager.dart';
import 'alart_formfield.dart';

class BuildAlertDialog extends StatelessWidget {
  const BuildAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    return AlertDialog(
      title: Text(
        "Reset Password",
        style: StyleManager.textStyle1.copyWith(fontSize: 15),
      ),
      content: SizedBox(
        height: 220,
        child: Column(
          children: [
            buildRow(
              emailController,
              Icons.email_outlined,
              'Email',
            ),
            const SizedBox(
              height: 15,
            ),
            buildRow(
              passwordController,
              Icons.lock_outline,
              'Password',
            ),
            const SizedBox(
              height: 15,
            ),
            buildRow(
              confirmPasswordController,
              Icons.lock_outline,
              'Confirm Password',
            ),
            const SizedBox(
              height: 30,
            ),
            AddButton(
              onTap: () {},
              text: "Submit",
              color: ColorsManager.primaryColor,
            )
          ],
        ),
      ),
    );
  }

  Row buildRow(TextEditingController controller, IconData icon, String text) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: Icon(
            icon,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        AlertFormField(
          controller: controller,
          height: 40,
          width: 250,
          hintText: text,
        )
      ],
    );
  }
}
