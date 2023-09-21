import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/core/core_models/user_model.dart';
import 'package:seasons_dashboard/features/users/presentation/cubit/users_cubit/users_cubit.dart';
import 'package:seasons_dashboard/features/users/presentation/cubit/users_cubit/users_states.dart';

import '../../../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../../../core/resources_manager/style_manager.dart';



class AdminUserBody extends StatelessWidget {
  const AdminUserBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width-350 < 110*10 ? 110*10 :  MediaQuery.of(context).size.width-350,
        child:  SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children:
                [
                  HotelItemTextBuilder(text: '#', isHeader: true),
                  HotelItemTextBuilder(text: 'Main Image', isHeader: true,),
                  HotelItemTextBuilder(text: 'Full Name', isHeader: true,),
                  HotelItemTextBuilder(text: 'Email', isHeader: true,),
                  HotelItemTextBuilder(text: 'User Type', isHeader: true,),
                  HotelItemTextBuilder(text: 'Agent Discount', isHeader: true,),
                  HotelItemTextBuilder(text: 'Agent Balance', isHeader: true,),
                  HotelItemTextBuilder(text: 'Tools', isHeader: true,),


                ],
              ),
              BlocConsumer<UsersCubit, UsersStates>(
                  builder: (context, state) {
                    if (state is ViewAllUsersLoadingState) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width - 350,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            )),
                      );
                    } else if (state is ViewAllUsersErrorState) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width - 350,
                            child: Center(
                                child: Text(
                                  state.error,
                                  style: const TextStyle(color: Colors.red),
                                ))),
                      );
                    }
                    return SizedBox(
                      width: MediaQuery.of(context).size.width - 350 < 110 * 10
                          ? 110 * 10
                          : MediaQuery.of(context).size.width - 350,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => AdminUserBuilder(
                              index: index + 1,
                              userModel:
                              UsersCubit.get(context).users[index]),
                          // separatorBuilder: (context, index) =>
                          // const SizedBox(),
                          //itemCount:10),
                          itemCount:UsersCubit.get(context).users.length),
                    );
                  },
                  listener: (context, state) {})
            ],
          ),
        )
    );
  }
}

class AdminUserBuilder extends StatelessWidget {
  const AdminUserBuilder({Key? key,required this.index, required this.userModel}) : super(key: key);

  final UserModel userModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: index %2==0 ? Colors.white :Colors.grey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          HotelItemTextBuilder(text: '$index'),
          Container(
              height: 80,
              width: (MediaQuery.of(context).size.width-300)/10 <100 ? 120 : (MediaQuery.of(context).size.width-300)/10+10,
              decoration: const BoxDecoration(
                borderRadius:
                BorderRadius.only(topRight: Radius.circular(60)),
              ),
              child:
                   Image.network(
                  "https://api.seasonsge.com/images/Agents/${userModel.img}",
                fit: BoxFit.fill,
              )),
         // HotelItemTextBuilder(text: flight.lineLogo),
          HotelItemTextBuilder(text: userModel.name!),
          HotelItemTextBuilder(text: userModel.email!),
          HotelItemTextBuilder(text: userModel.type =='0'? 'Admin' : 'Agent'),
          HotelItemTextBuilder(text: userModel.discount!),
          HotelItemTextBuilder(text: userModel.balance!),
          SizedBox(
            width: (MediaQuery.of(context).size.width-350)/10 <110 ?110 :(MediaQuery.of(context).size.width-350)/10,
            child:  Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green
                        ),
                        child: IconButton(
                            onPressed: ()
                            {
                              AppCubit.get(context).addNewTapped(0, userModel: userModel);
                            },
                            icon: const Icon(Icons.edit, color: Colors.white,))),
                    const SizedBox(width: 5,),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red
                        ),
                        child: IconButton(
                            onPressed: ()
                            {
                              UsersCubit.get(context).delete(
                                  context: context,
                                  id: userModel.id!,
                              index: index-1);
                            },
                            icon: const Icon(Icons.delete, color: Colors.white,))),
                  ],
                ),
                const SizedBox(height: 5,),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.cyan
                    ),
                    child: TextButton(
                        onPressed: ()
                        {
                          userModel.fromAddBalance = true;
                          AppCubit.get(context).addNewTapped(0, userModel: userModel);
                        },
                        child: const Text('Add Balance', style: TextStyle(color: Colors.white),))),
                
              ],
            ),
          )

        ],
      ),
    );
  }
}

class HotelItemTextBuilder extends StatelessWidget {
  const HotelItemTextBuilder({Key? key,
    required this.text,
    this.width = double.infinity,
    this.isHeader = false,
  }) : super(key: key);

  final String text;
  final double width;
  final bool isHeader;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsetsDirectional.only(end: 10),
        width:  (MediaQuery.of(context).size.width-300)/10 <100 ? 110 : (MediaQuery.of(context).size.width-300)/10,
        child: Text(
          text,
          style: isHeader ?
          StyleManager.drawerTextStyle.copyWith(color: Colors.blueGrey):
          StyleManager.drawerTextStyle.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        )
    );
  }
}
