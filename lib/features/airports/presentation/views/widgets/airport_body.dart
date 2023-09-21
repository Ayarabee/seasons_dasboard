import 'package:flutter/material.dart';

import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/resources_manager/style_manager.dart';


class AirPort
{
  String name;
  String nameEn;

  AirPort({
    required this.name,
    required this.nameEn,
  });
}
class AddressRow4 extends StatelessWidget {
  const AddressRow4({Key? key, required this.airports}) : super(key: key);
  final List<AirPort> airports;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 50.0 * (hotels.length+1) +(20*hotels.length+1),
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
                  HotelItemTextBuilder(text: 'Airport Name', isHeader: true,),
                  HotelItemTextBuilder(text: 'Airport Name English', isHeader: true,),
                  HotelItemTextBuilder(text: 'Tools', isHeader: true,),


                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width-350 < 110*5 ? 110*5 :  MediaQuery.of(context).size.width-350,
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index)=>
                        HotelBuilder(index: index+1, airport: airports[index]),
                    separatorBuilder: (context, index)=>const SizedBox(),
                    itemCount: airports.length),
              )

            ],
          ),
        )
    );
  }
}

class HotelBuilder extends StatelessWidget {
  const HotelBuilder({Key? key,required this.index, required this.airport}) : super(key: key);

  final AirPort airport;
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
          HotelItemTextBuilder(text: airport.name),
          HotelItemTextBuilder(text: airport.nameEn),
          SizedBox(
            width: (MediaQuery.of(context).size.width-350)/5 <110 ?110 :(MediaQuery.of(context).size.width-350)/5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children:
              [

                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.cyan
                    ),
                    child: IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.edit, color: Colors.white,))),
                const SizedBox(width: 5,),
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
