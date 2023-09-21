import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/car_types/data/models/car_type_model.dart';

import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_states.dart';
import '../../../../core/app_widgets/default_form_field.dart';
import '../../../../core/resources_manager/colors_manager.dart';
import '../../../../core/resources_manager/style_manager.dart';
import '../cubit/car_types_cubit/car_types_cubit.dart';
import '../cubit/car_types_cubit/car_types_states.dart';

class AddNewCarTypeView extends StatefulWidget {
  const AddNewCarTypeView({Key? key}) : super(key: key);

  @override
  State<AddNewCarTypeView> createState() => _AddNewCarTypeViewState();
}

class _AddNewCarTypeViewState extends State<AddNewCarTypeView> {
  @override
  void dispose() {
    AppCubit.get(context).carTypeModelC = null;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var name = TextEditingController();
    var nameEn = TextEditingController();
    bool isUpdate = false;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if(AppCubit.get(context).carTypeModelC != null)
        {
          isUpdate = true;
          name.text = AppCubit.get(context).carTypeModelC!.name!;
          nameEn.text = AppCubit.get(context).carTypeModelC!.nameEn!;
        }
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child:SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                  [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text( isUpdate? 'Edit Car Type' :'Add New Car Type',style:const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20,),
                        FieldBuilder(text: 'Type Name', controller: name, ),
                        const SizedBox(height: 20,),
                        FieldBuilder(text: 'Type Name English', controller: nameEn),

                      ],
                    ),



                    const SizedBox(height: 40,),
                    BlocConsumer<CarTypeCubit, CarTypesStates>(
                        builder: (context, state)
                        {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            height: 65,
                            width: 200,
                            child: MaterialButton(
                              onPressed: ()
                              {
                                if (formKey.currentState!.validate())
                                {
                                  if (isUpdate)
                                  {
                                    CarTypeCubit.get(context).editCarType(
                                        context: context,
                                        carType: CarTypeModel(
                                          id : AppCubit.get(context).carTypeModelC!.id,
                                            name: name.text,
                                            nameEn: nameEn.text
                                        )
                                    );
                                  }
                                  else {
                                    CarTypeCubit.get(context).addCarType(
                                      context: context,
                                        carType: CarTypeModel(
                                            name: name.text,
                                            nameEn: nameEn.text
                                        )
                                    );
                                  }
                                }
                              },
                              color: Colors.black,
                              child:  Text(isUpdate? 'Update':'Next', style: const TextStyle(color: Colors.blueGrey, fontSize: 18),),
                            ),
                          );
                        },
                        listener: (context, state){}
                    )

                  ],
                ),
              ),
            ),
          ),
        );
      },
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
        DefaultFormField(controller: controller,)
      ],
    );
  }
}