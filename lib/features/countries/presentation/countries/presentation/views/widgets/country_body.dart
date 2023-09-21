import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/core/core_models/user_model.dart';
import 'package:seasons_dashboard/features/countries/data/models/country_model.dart';
import 'package:seasons_dashboard/features/countries/presentation/cubit/countries_cubit/countries_cubit.dart';
import 'package:seasons_dashboard/features/countries/presentation/cubit/countries_cubit/countries_states.dart';

import '../../../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../../../core/resources_manager/style_manager.dart';



class CountryBody extends StatelessWidget {
  const CountryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width-350 < 110*5 ? 110*5 :  MediaQuery.of(context).size.width-350,
        child:  SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children:
                [
                  HotelItemTextBuilder(text: '#', isHeader: true),
                  HotelItemTextBuilder(text: 'Country Name', isHeader: true,),
                  HotelItemTextBuilder(text: 'Country Name English', isHeader: true,),
                  HotelItemTextBuilder(text: 'Tools', isHeader: true,),

                ],
              ),
              BlocConsumer<CountriesCubit, CountriesStates>(
                  builder: (context, state) {
                    if (state is ViewCountriesLoadingState) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width - 350,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            )),
                      );
                    } else if (state is ViewCountriesErrorState) {
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
                      width: MediaQuery.of(context).size.width - 350 < 110 * 5
                          ? 110 * 5
                          : MediaQuery.of(context).size.width - 350,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => CountryBuilder(
                              index: index + 1,
                              country:
                              CountriesCubit.get(context).countries[index]),
                          // separatorBuilder: (context, index) =>
                          // const SizedBox(),
                          //itemCount:10),
                          itemCount:CountriesCubit.get(context).countries.length),
                    );
                  },
                  listener: (context, state) {})
            ],
          ),
        )
    );
  }
}

class CountryBuilder extends StatelessWidget {
  const CountryBuilder({Key? key,required this.index, required this.country}) : super(key: key);

  final CountryModel country;
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
          HotelItemTextBuilder(text: country.name!),
          HotelItemTextBuilder(text: country.nameEn!),
          SizedBox(
            width: (MediaQuery.of(context).size.width-350)/5 <110 ?110 :(MediaQuery.of(context).size.width-350)/5,
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
                          AppCubit.get(context).addNewTapped(1, countryModel: country);
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
                          CountriesCubit.get(context).deleteCountry(
                              context: context,
                              id: country.id!,
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
        width:  (MediaQuery.of(context).size.width-300)/5 <100 ? 110 : (MediaQuery.of(context).size.width-300)/5,
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
