import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/core/app_cubit/app_cubit.dart';
import 'package:seasons_dashboard/features/car_types/presentation/cubit/car_types_cubit/car_types_cubit.dart';
import 'package:seasons_dashboard/features/car_types/presentation/cubit/car_types_cubit/car_types_states.dart';

import '../../../../../core/resources_manager/style_manager.dart';
import '../../../data/models/car_type_model.dart';

class CarTypeViewBody extends StatelessWidget {
  const CarTypeViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width - 350 < 110 * 5
            ? 110 * 5
            : MediaQuery.of(context).size.width - 350,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  HotelItemTextBuilder(text: '#', isHeader: true),
                  HotelItemTextBuilder(
                    text: 'Name',
                    isHeader: true,
                  ),
                  HotelItemTextBuilder(
                    text: 'English Name',
                    isHeader: true,
                  ),
                  HotelItemTextBuilder(
                    text: 'Tools',
                    isHeader: true,
                  ),
                ],
              ),
              BlocConsumer<CarTypeCubit, CarTypesStates>(
                  builder: (context, state) {
                    if (state is ViewCarTypesLoadingState) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width - 350,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            )),
                      );
                    } else if (state is ViewCarTypesErrorState) {
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
                      child: ListView.separated(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => CarItemBuilder(
                              index: index + 1,
                              carType:
                                  CarTypeCubit.get(context).carTypes[index]),
                          separatorBuilder: (context, index) =>
                              const SizedBox(),
                          itemCount: CarTypeCubit.get(context).carTypes.length),
                    );
                  },
                  listener: (context, state) {})
            ],
          ),
        ));
  }
}

class CarItemBuilder extends StatelessWidget {
  const CarItemBuilder({Key? key, required this.index, required this.carType})
      : super(key: key);

  final CarTypeModel carType;
  final int index;

  @override
  Widget build(BuildContext context) {
    print('object2');
    print(carType.id);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: index % 2 == 0 ? Colors.white : Colors.grey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HotelItemTextBuilder(text: '$index'),
          HotelItemTextBuilder(text: carType.name!),
          HotelItemTextBuilder(text: carType.nameEn!),
          SizedBox(
            width: (MediaQuery.of(context).size.width - 350) / 5 < 110
                ? 110
                : (MediaQuery.of(context).size.width - 350) / 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green),
                    child: IconButton(
                        onPressed: () {
                          AppCubit.get(context)
                              .addNewTapped(12, carTypeModel: carType);
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ))),
                const SizedBox(
                  width: 5,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red),
                    child: IconButton(
                        onPressed: () {
                          CarTypeCubit.get(context)
                              .deleteCarType(context: context, id: carType.id!);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HotelItemTextBuilder extends StatelessWidget {
  const HotelItemTextBuilder({
    Key? key,
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
        width: (MediaQuery.of(context).size.width - 300) / 5 < 100
            ? 110
            : (MediaQuery.of(context).size.width - 300) / 5,
        child: Text(
          text,
          style: isHeader
              ? StyleManager.drawerTextStyle.copyWith(color: Colors.blueGrey)
              : StyleManager.drawerTextStyle.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ));
  }
}
