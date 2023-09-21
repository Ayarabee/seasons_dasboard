import 'package:flutter/material.dart';
import 'package:seasons_dashboard/core/core_models/user_model.dart';
import 'package:seasons_dashboard/features/users/presentation/cubit/users_cubit/users_cubit.dart';

import '../../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../../core/app_widgets/add_image.dart';
import '../../../../../../core/app_widgets/default_form_field.dart';
import '../../../../../../core/resources_manager/colors_manager.dart';
import '../../../../../../core/resources_manager/style_manager.dart';

class AddNewUser extends StatefulWidget {
  const AddNewUser({Key? key}) : super(key: key);

  @override
  State<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {

  bool isAgent = true;
  var formKey = GlobalKey<FormState>();
  bool isUpdate = false;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var agentDiscountController = TextEditingController();
  var agentBalanceController = TextEditingController();

  var currentBalanceController = TextEditingController();
  var newBalanceController = TextEditingController();
  bool fromAddBalance= false;
  @override
  void initState() {
    if(AppCubit.get(context).userModelC != null)
    {
      fromAddBalance = AppCubit.get(context).userModelC!.fromAddBalance ;
      isUpdate = true;
      nameController.text = AppCubit.get(context).userModelC!.name!;
      emailController.text = AppCubit.get(context).userModelC!.email!;
      currentBalanceController.text = AppCubit.get(context).userModelC!.balance!;
      isAgent = AppCubit.get(context).userModelC!.type == '1' ? true : false;
      //setState(() {});
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
                if(!fromAddBalance)
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
                                  isAgent = true;
                                });
                              },
                              child: Container(
                                  color: !isAgent? Colors.white:Colors.grey.withOpacity(0.2) ,
                                  child: Center(
                                    child: Text(
                                      'Agent',
                                      style: TextStyle(color: isAgent? Colors.blue : Colors.black),
                                    ),
                                  )),
                            )
                        ),
                        Expanded(
                            child: InkWell(
                              onTap: ()
                              {
                                setState(() {
                                  isAgent = false;
                                });
                              },
                              child: Container(
                                  color: isAgent? Colors.white:Colors.grey.withOpacity(0.2) ,
                                  child: Center(
                                    child: Text(
                                      'Admin',
                                      style: TextStyle(color: !isAgent? Colors.blue : Colors.black),
                                    ),
                                  )),
                            )
                        ),
                      ],
                    ),
                  ),

                  if(!fromAddBalance)
                  Column(
                    children: [
                      const SizedBox(height: 20,),
                      FieldBuilder(text: 'Full Name', controller: nameController, ),
                      const SizedBox(height: 20,),
                      FieldBuilder(text: 'Email', controller: emailController),
                      const SizedBox(height: 20,),
                    ],
                  ),

                  if (!isUpdate )
                  FieldBuilder(text: 'Password', controller: passwordController),

                  if (!isUpdate)
                      const SizedBox(height: 20,),

                  if (!isUpdate)
                      if(isAgent)
                  Column(
                    children: [
                      FieldBuilder(text: 'Agent Discount', controller: agentDiscountController),
                      const SizedBox(height: 20,),
                      FieldBuilder(text: 'Agent Balance', controller: agentBalanceController),
                      const SizedBox(height: 20,),
                    ],
                  ),

                  if(fromAddBalance)
                  Column(
                    children: [
                      FieldBuilder(text: 'Current Balance', controller: currentBalanceController),
                      const SizedBox(height: 20,),
                      FieldBuilder(text: 'New Balance', controller: newBalanceController),
                      const SizedBox(height: 20,),
                    ],
                  ),
                  if (!isUpdate)
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
                    if (formKey.currentState!.validate()
                        && (AppCubit.get(context).webImage2 != null || isUpdate))
                    {
                      if (isUpdate)
                      {
                        if(fromAddBalance)
                        {
                          AppCubit.get(context).userModelC!.balance = newBalanceController.text;
                        }
                        else
                        {
                          AppCubit.get(context).userModelC!.name = nameController.text;
                          AppCubit.get(context).userModelC!.email = emailController.text;
                          AppCubit.get(context).userModelC!.type = isAgent? '1' :'0';

                        }
                        UsersCubit.get(context).edit(
                            context: context,
                            userModel:AppCubit.get(context).userModelC!);
                      }
                      else {
                        print('33333333');
                        UsersCubit.get(context).add(
                            context: context,
                            userModel: UserModel(
                                name: nameController.text,
                                password: passwordController.text,
                                balance: agentBalanceController.text,
                                discount: agentDiscountController.text,
                                email: emailController.text,
                                type: isAgent ? '1' : '0',
                                imageUpload: AppCubit
                                    .get(context)
                                    .webImage2
                            )
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
