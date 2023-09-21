import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:seasons_dashboard/core/app_widgets/default_date_picker.dart';

import '../../../../../core/app_widgets/add_image.dart';
import '../../../../../core/app_widgets/default_drop_down.dart';
import '../../../../../core/app_widgets/default_form_field.dart';
import '../../../../../core/resources_manager/colors_manager.dart';
import '../../../../../core/resources_manager/style_manager.dart';

class CreateFlightReservation extends StatefulWidget {
  const CreateFlightReservation({Key? key}) : super(key: key);

  @override
  State<CreateFlightReservation> createState() => _CreateFlightReservationState();
}
String? arrivalIn;
String? goingFrom;

class _CreateFlightReservationState extends State<CreateFlightReservation> {
  var formKey = GlobalKey<FormState>();
  bool onWay = true;
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

                  SizedBox(
                    height: 60,
                    child: Row(
                      children:
                      [
                        Expanded(
                            child: InkWell(
                              onTap: ()
                              {
                                setState(() {
                                  onWay = true;
                                });
                              },
                              child: Container(
                                color: !onWay? Colors.white:Colors.grey.withOpacity(0.2) ,
                                  child: Center(
                                    child: Text(
                                        'Ony Way',
                                    style: TextStyle(color: onWay? Colors.blue : Colors.black),
                                    ),
                                  )),
                            )
                        ),
                        Expanded(
                            child: InkWell(
                              onTap: ()
                              {
                                setState(() {
                                  onWay = false;
                                });
                              },
                              child: Container(
                                  color: onWay? Colors.white:Colors.grey.withOpacity(0.2) ,
                                  child: Center(
                                    child: Text(
                                      'Round Trip',
                                      style: TextStyle(color: !onWay? Colors.blue : Colors.black),
                                    ),
                                  )),
                            )
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),

                  const Row(
                    children: [
                      Text('Going From', style: StyleManager.bookAboveInput,),
                      SizedBox(width: 5,),
                      Text('*', style: TextStyle(color: ColorsManager.tabBarIndicator),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  DefaultDropDown(
                      value: goingFrom,
                      onChanged: (value)
                      {
                        setState(() {
                          goingFrom = value!;
                        });
                      },
                      items: const ['goingFrom 1','goingFrom 2','goingFrom 3','goingFrom 4','goingFrom 5' ]
                  ),

                  const SizedBox(height: 20,),
                  const Row(
                    children: [
                      Text('Arrival In', style: StyleManager.bookAboveInput,),
                      SizedBox(width: 5,),
                      Text('*', style: TextStyle(color: ColorsManager.tabBarIndicator),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  DefaultDropDown(
                      value: arrivalIn,
                      onChanged: (value)
                      {
                        setState(() {
                          arrivalIn = value!;
                        });
                      },
                      items: const ['arrivalIn 1','arrivalIn 2','arrivalIn 3','arrivalIn 4','arrivalIn 5' ]
                  ),

                  const SizedBox(height: 20,),
                  const Row(
                    children: [
                      Text('Departure Date', style: StyleManager.bookAboveInput,),
                      SizedBox(width: 5,),
                      Text('*', style: TextStyle(color: ColorsManager.tabBarIndicator),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                 DefaultDatePicker(controller: TextEditingController()),

                  const SizedBox(height: 20,),
                  const Row(
                    children: [
                      Text('Return Date', style: StyleManager.bookAboveInput,),
                      SizedBox(width: 5,),
                      Text('*', style: TextStyle(color: ColorsManager.tabBarIndicator),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  DefaultDatePicker(controller: TextEditingController(), enabled: !onWay,),

                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Number Of Adults +12 years', controller: TextEditingController()),
                  const SizedBox(height: 20,),

                  FieldBuilder(text: 'Number Of Children 2 - 11 years', controller: TextEditingController()),
                  const SizedBox(height: 20,),

                  FieldBuilder(text: 'Number Of infants 0- 2 years', controller: TextEditingController()),
                  const SizedBox(height: 20,),


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
                  color: Colors.deepOrange,
                  child: const Text('Search', style: TextStyle(color: Colors.white, fontSize: 18),),
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
    this.enabled = true,
    required this.controller
  }) : super(key: key);

  final String text;
  final bool enabled;
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
        DefaultFormField(controller: controller, enabled: enabled,)
      ],
    );
  }
}


/*
                  // DateTimePicker(
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(2),
                  //       borderSide: BorderSide(color: Colors.grey.withOpacity(0.2))
                  //     )
                  //   ),
                  //   type: DateTimePickerType.dateTime,
                  //   initialValue: '',
                  //   firstDate: DateTime.now(),
                  //   lastDate: DateTime(2100),
                  //   dateLabelText: 'Date',
                  //   onChanged: (val) => print(val),
                  //   validator: (val) {
                  //     print(val);
                  //     return null;
                  //   },
                  //   onSaved: (val) => print(val),
                  // ),

 */

class DefaultCheckBox extends StatefulWidget {
  DefaultCheckBox({Key? key, required this.value, required this.text}) : super(key: key);

  bool value;
  String text;
  @override
  State<DefaultCheckBox> createState() => _DefaultCheckBoxState();
}

class _DefaultCheckBoxState extends State<DefaultCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      child: CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        activeColor: Colors.blueGrey,
        title: Text(
          widget.text,
          style:
          TextStyle(color: Colors.grey.withOpacity(0.2)),
        ),
        value: widget.value,
        onChanged: (val) {
          setState(() {
            widget.value = val!;
          });
        },
      ),
    );
  }
}
