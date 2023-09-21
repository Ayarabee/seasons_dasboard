import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:seasons_dashboard/core/app_widgets/default_date_picker.dart';

import '../../../../../core/app_widgets/add_image.dart';
import '../../../../../core/app_widgets/default_drop_down.dart';
import '../../../../../core/app_widgets/default_form_field.dart';
import '../../../../../core/resources_manager/colors_manager.dart';
import '../../../../../core/resources_manager/style_manager.dart';

class CreateProgramReservation extends StatefulWidget {
  const CreateProgramReservation({Key? key}) : super(key: key);

  @override
  State<CreateProgramReservation> createState() => _CreateProgramReservationState();
}
String? arrivalIn;
String? goingFrom;
String? roomType;
String? kidsReservation;

class _CreateProgramReservationState extends State<CreateProgramReservation> {
  var formKey = GlobalKey<FormState>();
  bool include = true;
  bool tapped = false;

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
                                  include = true;
                                });
                              },
                              child: Container(
                                color: !include? Colors.white:Colors.grey.withOpacity(0.2) ,
                                  child: Center(
                                    child: Text(
                                        'Include Flight',
                                    style: TextStyle(color: include? Colors.blue : Colors.black),
                                    ),
                                  )),
                            )
                        ),
                        Expanded(
                            child: InkWell(
                              onTap: ()
                              {
                                setState(() {
                                  include = false;
                                });
                              },
                              child: Container(
                                  color: include? Colors.white:Colors.grey.withOpacity(0.2) ,
                                  child: Center(
                                    child: Text(
                                      'Not Include Flight',
                                      style: TextStyle(color: !include? Colors.blue : Colors.black),
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
                      Text('Country Name', style: StyleManager.bookAboveInput,),
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
                      items: const ['Country 1','Country 2','Country 3','Country 4','Country 5' ]
                  ),

                  const SizedBox(height: 20,),
                  const Row(
                    children: [
                      Text('City', style: StyleManager.bookAboveInput,),
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
                      items: const ['City  1','City  2','City  3','City  4','City  5' ]
                  ),
                  
                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Number Of Adults +12 years', controller: TextEditingController()),
                  const SizedBox(height: 20,),

                  FieldBuilder(text: 'Number Of Children 2 - 11 years', controller: TextEditingController()),
                  const SizedBox(height: 20,),

                  FieldBuilder(text: 'Number Of infants 0- 2 years', controller: TextEditingController()),
                  const SizedBox(height: 20,),

                ],
              ),
              Container(
                  color: Colors.grey.withOpacity(0.5),
                  padding: const EdgeInsets.all(5),
                  child: const Text('You Can Customize your room(s) by click here',)),
              const SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: 65,
                width: 200,
                child: MaterialButton(
                  onPressed: ()
                  {
                    setState(() {
                      tapped = true;
                    });
                  },
                  color: Colors.deepOrange,
                  child: const Text('Select Room', style: TextStyle(color: Colors.white, fontSize: 18),),
                ),
              ),
              const SizedBox(height: 10,),


              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: tapped
                      ? const Border()
                      : Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'roomType',
                          style: StyleManager.textStyle1,
                        ),
                      ),
                    ),
                    if (!tapped)
                      Container(
                        height: 40,
                        width: 1,
                        color: Colors.grey,
                      ),
                    Expanded(
                      child: Center(
                        child: Text('kidsReservation',
                            style: StyleManager.textStyle1),
                      ),
                    ),
                    if (!tapped)
                      Container(
                        height: 40,
                        width: 1,
                        color: Colors.grey,
                      ),
                    Expanded(
                      child: Center(
                        child: Text('kidsCount',
                            style: StyleManager.textStyle1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              tapped
                  ? Stack(
                children: [
                  Container(
                    height: 40,
                    width: double.infinity,
                    // padding: const EdgeInsets.only(top: 17),
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: DefaultDropDown(
                                value: roomType,
                                onChanged: (value)
                                {
                                  setState(() {
                                    roomType = value!;
                                  });
                                },
                                items: const ['roomType  1','roomType  2','roomType  3' ]
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Center(
                            child: DefaultDropDown(
                                value: kidsReservation,
                                onChanged: (value)
                                {
                                  setState(() {
                                    kidsReservation = value!;
                                  });
                                },
                                items: const ['kidsReservation  1','kidsReservation  2','roomType  3' ]
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Center(
                            child: DefaultFormField(controller: TextEditingController()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          tapped = false;
                        });
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
                  : const SizedBox(),

              const SizedBox(
                height: 20,
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
