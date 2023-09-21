import 'package:flutter/material.dart';

import '../../../../../core/app_widgets/add_image.dart';
import '../../../../../core/app_widgets/default_drop_down.dart';
import '../../../../../core/app_widgets/default_form_field.dart';
import '../../../../../core/resources_manager/colors_manager.dart';
import '../../../../../core/resources_manager/style_manager.dart';

class AddNewFlightLine extends StatefulWidget {
  const AddNewFlightLine({Key? key}) : super(key: key);

  @override
  State<AddNewFlightLine> createState() => _AddNewFlightLineState();
}


class _AddNewFlightLineState extends State<AddNewFlightLine> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return   Form(
      key: formKey,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey.withOpacity(0.1))
        ),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text('Add New FlightLine',style:TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Line Arabic Name', controller: TextEditingController(), ),
                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Line English Name ', controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  const AddImage()
                ],
              ),



              const SizedBox(height: 40,),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: 65,
                width: 200,
                child: MaterialButton(
                  onPressed: ()
                  {
                    if (formKey.currentState!.validate())
                    {}
                  },
                  color: Colors.black,
                  child: const Text('Next', style: TextStyle(color: Colors.blueGrey, fontSize: 18),),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
class FieldBuilder extends StatelessWidget {
  const FieldBuilder({
    Key? key,
    required this.text,
    required this.controller
  }) : super(key: key);

  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      [
        const SizedBox(height: 20,),
        Row(
          children: [
            Text(text, style: StyleManager.bookAboveInput,),
            const SizedBox(width: 5,),
            const Text('*', style: TextStyle(color: ColorsManager.tabBarIndicator),),
          ],
        ),
        const SizedBox(height: 10,),
        DefaultFormField(controller: controller, enabled: false,)
      ],
    );
  }
}


