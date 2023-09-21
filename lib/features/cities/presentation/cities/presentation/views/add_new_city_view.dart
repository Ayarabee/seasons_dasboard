import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/core/app_widgets/default_drop_down.dart';
import 'package:seasons_dashboard/features/cities/data/models/city_model.dart';
import 'package:seasons_dashboard/features/cities/presentation/cubit/city_cubit/city_cubit.dart';
import 'package:seasons_dashboard/features/countries/data/models/country_model.dart';
import 'package:seasons_dashboard/features/countries/presentation/cubit/countries_cubit/countries_cubit.dart';
import 'package:seasons_dashboard/features/countries/presentation/cubit/countries_cubit/countries_states.dart';

import '../../../../../../core/app_cubit/app_cubit.dart';

import '../../../../../../core/app_widgets/add_image.dart';
import '../../../../../../core/app_widgets/default_form_field.dart';
import '../../../../../../core/app_widgets/my_snack_bar.dart';
import '../../../../../../core/resources_manager/colors_manager.dart';
import '../../../../../../core/resources_manager/style_manager.dart';


class AddNewCity extends StatefulWidget {
  const AddNewCity({Key? key}) : super(key: key);

  @override
  State<AddNewCity> createState() => _AddNewCityState();
}

String? country;
String? countryId;
class _AddNewCityState extends State<AddNewCity> {
  var formKey = GlobalKey<FormState>();
  bool isUpdate = false;
  var cityNameController = TextEditingController();
  var cityEngNameController = TextEditingController();
  @override
  void initState() {
    if(AppCubit.get(context).cityModelC != null)
    {
      isUpdate = true;
      cityNameController.text = AppCubit.get(context).cityModelC!.name!;
      cityEngNameController.text = AppCubit.get(context).cityModelC!.nameEn!;
      countryId = AppCubit.get(context).cityModelC!.countryId!;
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
                  const Row(
                    children: [
                      Text('Countries', style: StyleManager.bookAboveInput,),
                      SizedBox(width: 5,),
                      Text('*', style: TextStyle(color: ColorsManager.tabBarIndicator),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  BlocConsumer<CountriesCubit, CountriesStates>(
                      builder: (context, state)
                      {
                        if (state is ViewCountriesLoadingState)
                        {
                          return const Center( child:  CircularProgressIndicator(),);
                        }
                        else if (state is ViewCountriesErrorState)
                        {
                          return const Center(child: Text('Error Loading Countries'),);
                        }
                        else
                        {
                          if(isUpdate)
                          {
                            print('+++++++++');
                            print(AppCubit.get(context).cityModelC!.countryId);
                            for (int i=0; i<CountriesCubit.get(context).countries.length; i++)
                            {
                              if(CountriesCubit.get(context).countries[i].id == AppCubit.get(context).cityModelC!.countryId!)
                              {
                                country = CountriesCubit.get(context).countries[i].name;
                                break;
                              }
                              print('999999999');
                              print(country);
                            }
                          }
                          return CountryDropDown(
                              value: country,
                              onChanged: (value)
                              {
                                setState(() {
                                  country = value;
                                });
                              }, items: CountriesCubit.get(context).countries
                          );
                        }
                      },
                      listener: (context, state){}),

                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'City Name', controller: cityNameController, ),
                  const SizedBox(height: 20,),
                  FieldBuilder(text: 'City English Name', controller: cityEngNameController),
                  const SizedBox(height: 20,),
                  // if(isUpdate)
                  //   Image.network('https://api.seasonsge.com/images/Agents${AppCubit.get(context).cityModelC!.img!}'),
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
                    if(countryId == null)
                    {
                      callMySnackBar(context: context, text: 'Please Choose Country');
                    }
                    if (formKey.currentState!.validate()
                        && AppCubit.get(context).webImage2 != null && countryId != null)
                    {
                      if (isUpdate)
                      {
                        AppCubit.get(context).cityModelC!.nameEn = cityEngNameController.text;
                        AppCubit.get(context).cityModelC!.name = cityNameController.text;
                        AppCubit.get(context).cityModelC!.imageUpload = AppCubit.get(context).webImage2;
                        AppCubit.get(context).cityModelC!.countryId = countryId;

                        CityCubit.get(context).editCity(
                            context: context,
                            city: AppCubit.get(context).cityModelC!
                        );
                      }
                      else {
                        CityCubit.get(context).addCity(
                          context: context,
                          arName: cityNameController.text,
                          enName: cityEngNameController.text,
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


class CountryDropDown extends StatelessWidget {
  CountryDropDown({Key? key,
    // required this.hint,
    required this.value,
    required this.onChanged,
    required this.items,
  }) : super(key: key);
  //final String hint;
  String? value;
  final void Function(String?)? onChanged;
  final List<CountryModel> items;

  String? printer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.2))
      ),
      //height: 30,
      padding: const EdgeInsetsDirectional.only(start: 10),
      child: DropdownButton(
          isExpanded: true,
          style: StyleManager.bookInputField,
          underline: const SizedBox(),
          icon: const SizedBox(),
          value: value,
          items:
          items.map(buildMenuItem).toList(),
          onChanged: onChanged
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(CountryModel item) =>
      DropdownMenuItem(
        onTap: ()
        {
          countryId = item.id;
        },
          value: item.name,
          child: Text(
            item.name!,
            style:StyleManager.bookInputField,
          )
      );
}