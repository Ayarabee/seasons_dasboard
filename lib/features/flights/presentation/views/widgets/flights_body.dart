import 'package:flutter/material.dart';

import '../../../../../core/resources_manager/style_manager.dart';


class Flight
{
  String line;
  String goingFrom;
  String arrivalIn;
  String departureDate;
  String returnDate;
  String isAvailable;
  String isRoundTrip;
  String adultPrice;
  String childPrice;
  String infantPrice;
  String ticketsCount;
  String availableTickets;

  Flight({
    required this.line,
    required this.goingFrom,
    required this.arrivalIn,
    required this.departureDate,
    required this.returnDate,
    required this.isAvailable,
    required this.isRoundTrip,
    required this.adultPrice,
    required this.childPrice,
    required this.infantPrice,
    required this.ticketsCount,
    required this.availableTickets,
  });
}
class AddressRow6 extends StatelessWidget {
  const AddressRow6({Key? key, required this.flights}) : super(key: key);
  final List<Flight> flights;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 50.0 * (hotels.length+1) +(20*hotels.length+1),
        width: MediaQuery.of(context).size.width-350 < 110*16 ? 110*16 :  MediaQuery.of(context).size.width-350,
        child:  SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children:
                [
                  HotelItemTextBuilder(text: '#', isHeader: true),
                  HotelItemTextBuilder(text: 'Flight Line', isHeader: true,),
                  HotelItemTextBuilder(text: 'Going from', isHeader: true,),
                  HotelItemTextBuilder(text: 'Arrival in', isHeader: true,),
                  HotelItemTextBuilder(text: 'Departure Date', isHeader: true,),
                  HotelItemTextBuilder(text: 'Return date', isHeader: true,),
                  HotelItemTextBuilder(text: 'Is Available', isHeader: true,),
                  HotelItemTextBuilder(text: 'Is Round Trip', isHeader: true,),
                  HotelItemTextBuilder(text: 'Adult Price', isHeader: true,),
                  HotelItemTextBuilder(text: 'Child Price', isHeader: true,),
                  HotelItemTextBuilder(text: 'Infant Price', isHeader: true,),
                  HotelItemTextBuilder(text: 'Tickets count', isHeader: true,),
                  HotelItemTextBuilder(text: 'Available Tickets', isHeader: true,),
                  HotelItemTextBuilder(text: 'Tools', isHeader: true,),


                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width-350 < 110*16 ? 110*16 :  MediaQuery.of(context).size.width-350,
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index)=>
                        HotelBuilder(index: index+1, hotel: flights[index]),
                    separatorBuilder: (context, index)=>const SizedBox(),
                    itemCount: flights.length),
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

  final Flight hotel;
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
              width: (MediaQuery.of(context).size.width-300)/16 <100 ? 120 : (MediaQuery.of(context).size.width-300)/16+10,
              decoration: const BoxDecoration(
                borderRadius:
                BorderRadius.only(topRight: Radius.circular(60)),
              ),
              child:
              Image.network(
                "data:image/png;base64,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",
                fit: BoxFit.fill,
              )),
          //HotelItemTextBuilder(text: hotel.line),
          HotelItemTextBuilder(text: hotel.goingFrom),
          HotelItemTextBuilder(text: hotel.arrivalIn),
          HotelItemTextBuilder(text: hotel.departureDate),
          HotelItemTextBuilder(text: hotel.returnDate),
          HotelItemTextBuilder(text: hotel.isAvailable),
          HotelItemTextBuilder(text: hotel.isRoundTrip),
          HotelItemTextBuilder(text: hotel.adultPrice),
          HotelItemTextBuilder(text: hotel.childPrice),
          HotelItemTextBuilder(text: hotel.infantPrice),
          HotelItemTextBuilder(text: hotel.ticketsCount),
          HotelItemTextBuilder(text: hotel.availableTickets),
          SizedBox(
            width: (MediaQuery.of(context).size.width-350)/16 <110 ?110 :(MediaQuery.of(context).size.width-350)/16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

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
        width:  (MediaQuery.of(context).size.width-300)/16 <100 ? 110 : (MediaQuery.of(context).size.width-300)/16,
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
