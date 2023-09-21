import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/car/data/models/car_model.dart';
import 'package:seasons_dashboard/features/car/presentation/cubit/delete_car_cubit/delete_car_cubit.dart';
import 'package:seasons_dashboard/features/car/presentation/cubit/delete_car_cubit/delete_car_states.dart';
import 'package:seasons_dashboard/features/car/presentation/cubit/edit_car_cubit/edit_car_cubit.dart';
import 'package:seasons_dashboard/features/car/presentation/cubit/edit_car_cubit/edit_car_states.dart';

import '../../../../../core/resources_manager/style_manager.dart';


class CarViewBody extends StatelessWidget {
  const CarViewBody({Key? key, required this.cars}) : super(key: key);
  final List<CarModel> cars;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width-350 < 110*6 ? 110*6 :  MediaQuery.of(context).size.width-350,
        child:  SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children:
                [
                  HotelItemTextBuilder(text: '#', isHeader: true),
                  HotelItemTextBuilder(text: 'Car Type', isHeader: true,),
                  HotelItemTextBuilder(text: 'Price per day', isHeader: true,),
                  HotelItemTextBuilder(text: 'Is Available ?', isHeader: true,),
                  HotelItemTextBuilder(text: 'Tools', isHeader: true,),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width-350 < 110*6 ? 110*6 :  MediaQuery.of(context).size.width-350,
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index)=>
                        CarItemBuilder(index: index+1, car: cars[index]),
                    separatorBuilder: (context, index)=>const SizedBox(),
                    itemCount: cars.length),
              )

            ],
          ),
        )
    );
  }
}

class CarItemBuilder extends StatelessWidget {
  const CarItemBuilder({Key? key,required this.index, required this.car}) : super(key: key);

  final CarModel car;
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
          HotelItemTextBuilder(text: car.typeId!),
          HotelItemTextBuilder(text: car.pricePerDay!),
          HotelItemTextBuilder(text: car.status=='0' ? 'Not Available' : 'Available' ),
          SizedBox(
            width: (MediaQuery.of(context).size.width-350)/6 <110 ?110 :(MediaQuery.of(context).size.width-350)/6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
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
                            onPressed: (){},
                            icon: const Icon(Icons.edit, color: Colors.white,))),

                    const SizedBox(width: 5,),

                    BlocConsumer<DeleteCarCubit, DeleteCarStates>(
                        builder: (context, state)
                        {
                          return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red
                              ),
                              child: IconButton(
                                  onPressed: ()
                                  {
                                    DeleteCarCubit.get(context).deleteCar(id: car.id!);
                                  },
                                  icon: const Icon(Icons.delete, color: Colors.white,)));
                        }, listener: (context, state){}
                    ),
                  ],
                ),
                InkWell(
                  onTap: ()
                  {

                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: car.status =='1'? Colors.red : Colors.green
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Text( car.status =='1'? 'Not Available' : 'Available',
                        style: const TextStyle(color: Colors.white),)),
                ),
                const SizedBox(height: 5,),

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
        width:  (MediaQuery.of(context).size.width-300)/6 <100 ? 110 : (MediaQuery.of(context).size.width-300)/6,
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
