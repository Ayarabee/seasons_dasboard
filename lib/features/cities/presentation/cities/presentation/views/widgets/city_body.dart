import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/core/core_models/user_model.dart';
import 'package:seasons_dashboard/features/cities/data/models/city_model.dart';
import 'package:seasons_dashboard/features/cities/presentation/cubit/city_cubit/city_cubit.dart';
import 'package:seasons_dashboard/features/cities/presentation/cubit/city_cubit/city_states.dart';

import '../../../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../../../core/resources_manager/style_manager.dart';



class CityBody extends StatelessWidget {
  const CityBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width-350 < 110*7 ? 110*7 :  MediaQuery.of(context).size.width-350,
        child:  SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children:
                [
                  HotelItemTextBuilder(text: '#', isHeader: true),
                  HotelItemTextBuilder(text: 'City Name', isHeader: true,),
                  HotelItemTextBuilder(text: 'City Name English', isHeader: true,),
                  HotelItemTextBuilder(text: 'Country Name', isHeader: true,),
                  HotelItemTextBuilder(text: 'Country Name English', isHeader: true,),
                  HotelItemTextBuilder(text: 'Tools', isHeader: true,),
                ],
              ),
              BlocConsumer<CityCubit, CityStates>(
                  builder: (context, state) {
                    if (state is ViewCitiesLoadingState) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width - 350,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            )),
                      );
                    } else if (state is ViewCitiesErrorState) {
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
                      width: MediaQuery.of(context).size.width - 350 < 110 * 7
                          ? 110 * 7
                          : MediaQuery.of(context).size.width - 350,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => CityBuilder(
                              index: index + 1,
                              city:
                              CityCubit.get(context).cities[index]),
                          // separatorBuilder: (context, index) =>
                          // const SizedBox(),
                          //itemCount:10),
                          itemCount:CityCubit.get(context).cities.length),
                    );
                  },
                  listener: (context, state) {})
            ],
          ),
        )
    );
  }
}

class CityBuilder extends StatelessWidget {
  const CityBuilder({Key? key,required this.index, required this.city}) : super(key: key);

  final CityModel city;
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
          HotelItemTextBuilder(text: city.name!),
          HotelItemTextBuilder(text: city.nameEn!),
          HotelItemTextBuilder(text: city.countryId!),
          HotelItemTextBuilder(text: city.countryId!),
          SizedBox(
            width: (MediaQuery.of(context).size.width-350)/7 <110 ?110 :(MediaQuery.of(context).size.width-350)/7,
            child:  Row(
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
                          AppCubit.get(context).addNewTapped(2, cityModel: city);
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
                          CityCubit.get(context).deleteCity(
                              context: context,
                              id: city.id!,
                              index: index-1
                          );
                        },
                        icon: const Icon(Icons.delete, color: Colors.white,))),
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
        width:  (MediaQuery.of(context).size.width-300)/7 <100 ? 110 : (MediaQuery.of(context).size.width-300)/7,
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
