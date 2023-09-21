import 'package:flutter/material.dart';
import 'package:seasons_dashboard/core/app_widgets/screens_background.dart';

import '../../../../../../core/app_widgets/AddButton.dart';
import '../../../../../../core/resources_manager/style_manager.dart';
import 'widgets/build_alart_dialog.dart';
import 'widgets/login_textform.dart';


class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return ScreensBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: 400,
            width: 500,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey[200]!, width: .5),
                color: Colors.white24.withOpacity(.2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "ADMIN LOGIN",
                  style: StyleManager.appBarTextStyle.copyWith(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                LoginTextForm(
                  controller: emailController,
                  height: 35,
                  width: 250,
                  labelText: 'Email',
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                LoginTextForm(
                  controller: emailController,
                  height: 35,
                  width: 250,
                  labelText: 'Password',
                  icon: const Icon(
                    Icons.lock_outline,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        const alert = BuildAlertDialog();
                        showDialog(
                          context: context,
                          builder: (BuildContext ctx) => alert,
                          barrierDismissible: true,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 100.0),
                        child: Text(
                          "Forgot Password ?",
                          style: StyleManager.drawerTextStyle.copyWith(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 200,
                  child: AddButton(
                    onTap: () {},
                    text: "LOGIN",
                    color: Colors.redAccent,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
