import 'package:flutter/material.dart';
import 'package:seasons_dashboard/features/countries/presentation/cubit/countries_cubit/countries_cubit.dart';

import '../../../../../../core/app_cubit/app_cubit.dart';

import '../../../../../../core/app_widgets/add_image.dart';
import '../../../../../../core/app_widgets/default_form_field.dart';
import '../../../../../../core/app_widgets/my_snack_bar.dart';
import '../../../../../../core/resources_manager/colors_manager.dart';
import '../../../../../../core/resources_manager/style_manager.dart';


class AddNewCountry extends StatefulWidget {
  const AddNewCountry({Key? key}) : super(key: key);

  @override
  State<AddNewCountry> createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<AddNewCountry> {
  var formKey = GlobalKey<FormState>();
  bool isUpdate = false;
  var countryNameController = TextEditingController();
  var countryEngNameController = TextEditingController();
  @override
  void initState() {
    if(AppCubit.get(context).countryModelC != null)
    {
      isUpdate = true;
      countryNameController.text = AppCubit.get(context).countryModelC!.name!;
      countryEngNameController.text = AppCubit.get(context).countryModelC!.nameEn!;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Form(
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
                children:
                [
                  FieldBuilder(text: 'Country Name', controller: countryNameController, ),
                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'Country English Name', controller: countryEngNameController),
                  const SizedBox(height: 20,),
                  // if(isUpdate)
                  //   Image.network('https://api.seasonsge.com/images/Agents${AppCubit.get(context).countryModelC!.img!}'),
                  //if(!isUpdate)
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
                    if(AppCubit.get(context).webImage2 == null)
                    {
                      callMySnackBar(context: context, text: 'Please Choose Image');
                    }
                    if (formKey.currentState!.validate()
                        && AppCubit.get(context).webImage2 != null )
                    {
                      if (isUpdate)
                      {
                        AppCubit.get(context).countryModelC!.nameEn = countryEngNameController.text;
                        AppCubit.get(context).countryModelC!.name = countryNameController.text;
                        AppCubit.get(context).countryModelC!.imageUpload = AppCubit.get(context).webImage2;

                        CountriesCubit.get(context).editCountry(
                            context: context,
                            country: AppCubit.get(context).countryModelC!
                        );
                      }
                      else {
                        CountriesCubit.get(context).addCountry(
                            context: context,
                            arName: countryNameController.text,
                            enName: countryEngNameController.text,
                            flag:  AppCubit
                                .get(context)
                                .webImage2,
                        );
                      }
                    }
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
        DefaultFormField(controller: controller,)
      ],
    );
  }
}
