import 'package:flutter/material.dart';

import '../../../../../core/resources_manager/style_manager.dart';


class ProgramReservation
{
  String id;
  String program;
  String whereToGo;
  String firstName;
  String lastName;
  String noOfAdults;
  String noOfChildren;
  String noOfInfants;
  String departureDate;
  String createdBy;


  ProgramReservation({
    required this.id,
    required this.program,
    required this.whereToGo,
    required this.createdBy,
    required this.departureDate,
    required this.firstName,
    required this.lastName,
    required this.noOfAdults,
    required this.noOfChildren,
    required this.noOfInfants,
  });
}
class AddressRow9 extends StatelessWidget {
  const AddressRow9({Key? key, required this.flightReservations}) : super(key: key);
  final List<ProgramReservation> flightReservations;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 50.0 * (hotels.length+1) +(20*hotels.length+1),
        width: MediaQuery.of(context).size.width-350 < 110*14 ? 110*14 :  MediaQuery.of(context).size.width-350,
        child:  SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children:
                [
                  HotelItemTextBuilder(text: '#', isHeader: true),
                  HotelItemTextBuilder(text: 'ID', isHeader: true,),
                  HotelItemTextBuilder(text: 'Programme', isHeader: true,),
                  HotelItemTextBuilder(text: 'Where To Go ?', isHeader: true,),
                  HotelItemTextBuilder(text: 'First Name', isHeader: true,),
                  HotelItemTextBuilder(text: 'Last Name', isHeader: true,),
                  HotelItemTextBuilder(text: 'Number Of Adults +12 years', isHeader: true,),
                  HotelItemTextBuilder(text: 'Number Of Children 2 - 11 years', isHeader: true,),
                  HotelItemTextBuilder(text: 'Number Of infants 0- 2 years', isHeader: true,),
                  HotelItemTextBuilder(text: 'Departure Date', isHeader: true,),
                  HotelItemTextBuilder(text: 'Created By ?', isHeader: true,),
                  HotelItemTextBuilder(text: 'Tools', isHeader: true,),


                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width-350 < 110*14 ? 110*14 :  MediaQuery.of(context).size.width-350,
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index)=>
                        HotelBuilder(index: index+1, hotel: flightReservations[index]),
                    separatorBuilder: (context, index)=>const SizedBox(),
                    itemCount: flightReservations.length),
              )

            ],
          ),
        )
    );
  }
}

class HotelBuilder extends StatelessWidget {
  const HotelBuilder({Key? key,required this.index, required this.hotel}) : super(key: key);

  final ProgramReservation hotel;
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
          HotelItemTextBuilder(text: hotel.id),
          HotelItemTextBuilder(text: hotel.program),
          HotelItemTextBuilder(text: hotel.whereToGo),
          HotelItemTextBuilder(text: hotel.firstName),
          HotelItemTextBuilder(text: hotel.lastName),
          HotelItemTextBuilder(text: hotel.noOfAdults),
          HotelItemTextBuilder(text: hotel.noOfChildren),
          HotelItemTextBuilder(text: hotel.noOfInfants),
          HotelItemTextBuilder(text: hotel.departureDate),
          HotelItemTextBuilder(text: hotel.createdBy),
          SizedBox(
            width: (MediaQuery.of(context).size.width-350)/14 <110 ?110 :(MediaQuery.of(context).size.width-350)/14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children:
              [
                InkWell(
                  onTap: ()
                  {

                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.amber
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Text('Details',style: TextStyle(color: Colors.white),)),
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
        width:  (MediaQuery.of(context).size.width-300)/14 <100 ? 110 : (MediaQuery.of(context).size.width-300)/14,
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
