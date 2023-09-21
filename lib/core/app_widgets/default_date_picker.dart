import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'default_form_field.dart';

class DefaultDatePicker extends StatelessWidget {
  const DefaultDatePicker({ Key? key,
        required this.controller,
    this.enabled=true
      })
      : super(key: key);
  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return DefaultFormField(
      enabled: enabled,
      controller: controller,
      textInputType: TextInputType.datetime,
      onTap: () {


            showDatePicker(
              context: context,

              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2030),
            ).then((value) {
              controller.text = value.toString().substring(0, 10);
            });
          },
      hint: '',
    );
  }
}

class DefaultTimePicker extends StatelessWidget {
  const DefaultTimePicker({ Key? key,
    required this.controller
  })
      : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultFormField(
      controller: controller,
      textInputType: TextInputType.datetime,
      onTap: () {


        showTimePicker(
          context: context,

          initialTime: TimeOfDay.now(),

        ).then((value) {
          controller.text = value!.format(context);
        });
      },
      hint: '',
    );
  }
}
