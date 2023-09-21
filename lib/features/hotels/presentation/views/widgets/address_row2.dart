import 'package:flutter/material.dart';

import '../../../../../core/resources_manager/style_manager.dart';


class Hotel
{
  String name;
  String nameEn;
  String type;
  String rate;
  String city;
  String isAvailable;

  Hotel({
    required this.name,
    required this.nameEn,
    required this.type,
    required this.rate,
    required this.city,
    required this.isAvailable
  });
}
class AddressRow2 extends StatelessWidget {
  const AddressRow2({Key? key, required this.addressList, required this.hotels}) : super(key: key);
  final List<String> addressList;
  final List<Hotel> hotels;

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
                  HotelItemTextBuilder(text: 'Hotel Name English', isHeader: true,),
                  HotelItemTextBuilder(text: 'Type', isHeader: true,),
                  HotelItemTextBuilder(text: 'Rate', isHeader: true,),
                  HotelItemTextBuilder(text: 'City', isHeader: true,),
                  HotelItemTextBuilder(text: 'Is Available', isHeader: true,),
                  HotelItemTextBuilder(text: 'Tools', isHeader: true,),


                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width-350 < 110*9 ? 110*9 :  MediaQuery.of(context).size.width-350,
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
      // ListView.separated(
      //   key: Key('1'),
      //     scrollDirection: Axis.horizontal,
      //     itemBuilder: (context, index) =>
      //         Column(
      //           children: [
      //             SizedBox(
      //               width: index == 0 ? 50 : 140,
      //               child: Text(
      //                 addressList[index],
      //                 style: StyleManager.drawerTextStyle
      //                     .copyWith(color: Colors.blueGrey),
      //                 //textAlign: TextAlign.center,
      //               )
      //             ),
      //             SizedBox(
      //               height: 400,
      //               width: 6*140+50,
      //               child: ListView.separated(
      //                   key: Key('2'),
      //                   physics: const NeverScrollableScrollPhysics(),
      //                   shrinkWrap: true,
      //                   itemBuilder: (context, index)=>
      //                   HotelBuilder(index: index+1, hotel: hotels[index]),
      //                       // SizedBox(
      //                       //     width: index == 0 ? 50 : 140,
      //                       //     child: Text(
      //                       //       addressList[index],
      //                       //       style: StyleManager.drawerTextStyle
      //                       //           .copyWith(color: Colors.blueGrey),
      //                       //       //textAlign: TextAlign.center,
      //                       //     )
      //                       // ),
      //                   separatorBuilder: (context, index)=>const SizedBox(height: 10,),
      //                   itemCount: hotels.length),
      //             )
      //
      //           ],
      //         ),
      //     separatorBuilder: (context, index) => const SizedBox(
      //           width: 0,
      //         ),
      //     itemCount: addressList.length
      // ),
    );
  }
}

class HotelBuilder extends StatelessWidget {
  const HotelBuilder({Key? key,required this.index, required this.hotel}) : super(key: key);

  final Hotel hotel;
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
          HotelItemTextBuilder(text: hotel.name),
          HotelItemTextBuilder(text: hotel.nameEn),
          HotelItemTextBuilder(text: hotel.type),
          HotelItemTextBuilder(text: hotel.rate),
          HotelItemTextBuilder(text: hotel.city),
          HotelItemTextBuilder(text: hotel.isAvailable),
          SizedBox(
            width: (MediaQuery.of(context).size.width-350)/9 <110 ?110 :(MediaQuery.of(context).size.width-350)/9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children:
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                  [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green
                        ),
                        child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.edit, color: Colors.white))),
                    const SizedBox(width: 10,),
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
                const SizedBox(height: 5,),
                Container(
                    width: 120,

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red
                    ),
                    child: TextButton(
                        onPressed: (){},
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text('Not Available',
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
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.cyan
                    ),
                    child: TextButton(
                        onPressed: (){},
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text('Create Hotel Reservation',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ))
                ),

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
        width:  (MediaQuery.of(context).size.width-300)/9 <100 ? 110 : (MediaQuery.of(context).size.width-300)/9,
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
