import 'package:flutter/material.dart';

import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/resources_manager/style_manager.dart';


class HotelRes
{
  String hotelName;
  String roomType;
  String firstName;
  String lastName;
  String daysCount;
  String total;
  String createdBy;

  HotelRes({
    required this.hotelName,
    required this.roomType,
    required this.firstName,
    required this.lastName,
    required this.daysCount,
    required this.total,
    required this.createdBy,
  });
}
class AddressRow3 extends StatelessWidget {
  const AddressRow3({Key? key, required this.hotels}) : super(key: key);
  final List<HotelRes> hotels;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 50.0 * (hotels.length+1) +(20*hotels.length+1),
        width: MediaQuery.of(context).size.width-350 < 110*9 ? 110*9 :  MediaQuery.of(context).size.width-350,
        child:  SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children:
                [
                  HotelItemTextBuilder(text: '#', isHeader: true),
                  HotelItemTextBuilder(text: 'Hotel Name', isHeader: true,),
                  HotelItemTextBuilder(text: 'Room Type', isHeader: true,),
                  HotelItemTextBuilder(text: 'First Name', isHeader: true,),
                  HotelItemTextBuilder(text: 'Last Name', isHeader: true,),
                  HotelItemTextBuilder(text: 'Days count', isHeader: true,),
                  HotelItemTextBuilder(text: 'Total', isHeader: true,),
                  HotelItemTextBuilder(text: 'Created By ?', isHeader: true,),
                  HotelItemTextBuilder(text: 'Tools', isHeader: true,),


                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width-350 < 110*10 ? 110*10 :  MediaQuery.of(context).size.width-350,
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index)=>
                        HotelBuilder(index: index+1, hotel: hotels[index]),
                    separatorBuilder: (context, index)=>const SizedBox(),
                    itemCount: hotels.length),
              )

            ],
          ),
        )
    );
  }
}

class HotelBuilder extends StatelessWidget {
  const HotelBuilder({Key? key,required this.index, required this.hotel}) : super(key: key);

  final HotelRes hotel;
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
          HotelItemTextBuilder(text: hotel.hotelName),
          HotelItemTextBuilder(text: hotel.roomType),
          HotelItemTextBuilder(text: hotel.firstName),
          HotelItemTextBuilder(text: hotel.lastName),
          HotelItemTextBuilder(text: hotel.daysCount),
          HotelItemTextBuilder(text: hotel.total),
          HotelItemTextBuilder(text: hotel.createdBy),
          SizedBox(
            width: (MediaQuery.of(context).size.width-350)/10 <110 ?110 :(MediaQuery.of(context).size.width-350)/10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children:
              [
                Container(
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.amberAccent
                    ),
                    child: TextButton(
                        onPressed: ()
                        {
                          AppCubit.get(context).addNewTapped(6);

                        },
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text('Details',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ))
                ),
                const SizedBox(height: 5,),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red
                    ),
                    child: IconButton(
                        onPressed: (){},
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
