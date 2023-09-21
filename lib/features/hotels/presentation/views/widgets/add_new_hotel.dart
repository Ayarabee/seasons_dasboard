import 'package:flutter/material.dart';

import '../../../../../core/app_widgets/add_image.dart';
import '../../../../../core/app_widgets/default_drop_down.dart';
import '../../../../../core/app_widgets/default_form_field.dart';
import '../../../../../core/resources_manager/colors_manager.dart';
import '../../../../../core/resources_manager/style_manager.dart';

class AddNewHotel extends StatefulWidget {
  const AddNewHotel({Key? key}) : super(key: key);

  @override
  State<AddNewHotel> createState() => _AddNewHotelState();
}
String? city;
String? type;
String? rate;

class _AddNewHotelState extends State<AddNewHotel> {
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
                  const Text('Add New Hotel',style:TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

                  const SizedBox(height: 20,),
                  const Row(
                    children: [
                      Text('Cities', style: StyleManager.bookAboveInput,),
                      SizedBox(width: 5,),
                      Text('*', style: TextStyle(color: ColorsManager.tabBarIndicator),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  DefaultDropDown(
                      value: city,
                      onChanged: (value)
                      {
                        setState(() {
                          city = value!;
                        });
                      },
                      items: const ['city 1','city 2','city 3','city 4','city 5' ]
                  ),

                  const SizedBox(height: 20,),
                  const Row(
                    children: [
                      Text('Hotel Type', style: StyleManager.bookAboveInput,),
                      SizedBox(width: 5,),
                      Text('*', style: TextStyle(color: ColorsManager.tabBarIndicator),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  DefaultDropDown(
                      value: type,
                      onChanged: (value)
                      {
                        setState(() {
                          type = value!;
                        });
                      },
                      items: const ['type 1','type 2','type 3','type 4','type 5' ]
                  ),

                  const SizedBox(height: 20,),
                  const Row(
                    children: [
                      Text('Hotel Rate', style: StyleManager.bookAboveInput,),
                      SizedBox(width: 5,),
                      Text('*', style: TextStyle(color: ColorsManager.tabBarIndicator),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  DefaultDropDown(
                      value: rate,
                      onChanged: (value)
                      {
                        setState(() {
                          rate = value!;
                        });
                      },
                      items: const ['rate 1','rate 2','rate 3','rate 4','rate 5' ]
                  ),

                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Hotel Name', controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Hotel Name English', controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  Text('USD', style: StyleManager.bookTypeTitle.copyWith(color: ColorsManager.tabBarIndicator),),
                  const SizedBox(height: 10,),
                  FieldBuilder(text: 'Single Adult Price per night', controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Double Adult Price per night', controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Triple Adult Price per night', controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Child price without Bed per night ', controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Child price with Bed per night ', controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Tax ', controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Hotel Description', controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Hotel Description English', controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Hotel Address Arabic', controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Hotel Address English', controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  const AddImage(),
                  const SizedBox(height: 20,),
                  const AddImage(text: 'Additional Images'),

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
        DefaultFormField(controller: controller)
      ],
    );
  }
}


