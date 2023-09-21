import 'package:flutter/material.dart';

import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/resources_manager/style_manager.dart';


class FlightLine
{
  String lineLogo;
  String lineArabicName;
  String lineEnglishName;


  FlightLine({
    required this.lineLogo,
    required this.lineArabicName,
    required this.lineEnglishName,
  });
}
class AddressRow5 extends StatelessWidget {
  const AddressRow5({Key? key, required this.flightLines}) : super(key: key);
  final List<FlightLine> flightLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 50.0 * (hotels.length+1) +(20*hotels.length+1),
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
                  HotelItemTextBuilder(text: 'Line Logo', isHeader: true,),
                  HotelItemTextBuilder(text: 'Line Arabic Name', isHeader: true,),
                  HotelItemTextBuilder(text: 'Line English Name	', isHeader: true,),
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
                        HotelBuilder(index: index+1, flight: flightLines[index]),
                    separatorBuilder: (context, index)=>const SizedBox(),
                    itemCount: flightLines.length),
              )

            ],
          ),
        )
    );
  }
}

class HotelBuilder extends StatelessWidget {
  const HotelBuilder({Key? key,required this.index, required this.flight}) : super(key: key);

  final FlightLine flight;
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
              width: (MediaQuery.of(context).size.width-300)/6 <100 ? 120 : (MediaQuery.of(context).size.width-300)/6+10,
              decoration: const BoxDecoration(
                borderRadius:
                BorderRadius.only(topRight: Radius.circular(60)),
              ),
              child:
                   Image.network(
                  "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOAAAADgCAMAAAAt85rTAAAAe1BMVEX///8AAABQUFDr6+vu7u5CQkL4+Pjq6uq8vLzz8/Ozs7Pn5+dZWVn7+/tsbGwxMTHS0tJfX1+EhITIyMjZ2dmWlpbh4eE4ODhISEiXl5dxcXEgICDOzs6Ojo6mpqaFhYUODg55eXkYGBgiIiKjo6O4uLgpKSk9PT0zMzP4YnLPAAAF80lEQVR4nO2d6WKCOBRGARFFXLBa3KpVuzjv/4TjluSyJFA1CZn5zr9SCByBbDcJngcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwP+OZLAOjDI89GNzev2Fb4Ogb0ZvbkfvQvfDgN/Wmt6Fw0i339iqn+9PNL+KgWW/M5lOvzfbdhc03sOBbbcrv9rew4ic5T3rmCSledtal+Can+Kg6xQKiOJMzxkSfoKdnhPU8MHPv9Bzgk/+eOpJv5YeN9RTp2GpL7Wk3gR+D7s6Uk9Z6loLIjXv7Bo6GhLfWb+BnniKfjSkzSppdnKYO+wW6sjGA/tP6Lkpc7+IoYa0mWBPQ9qNYRlpoCFtJqjj/W5MB4KPA8GnGIVhk2aQo4LpNvj1/WN3PKjb00nBny9fcAiV+zoo2Cn2gnwr93ZO8MMvMVbs7pxghZ+ymuKaYFLlp6ppuiZ4qhaU90k4JvhNnBbdI/lLdoRjgkJod041TkWGKisQ3RLsM50uq8Ts+BbJIW4J8jhHxDfxvkFJo8wpwdHkniLtI2PbJM+oU4LsYo8R2bi6b5R0TTolyArBXLk+u2+UFIVOCk7pRtY5KYk/OCmY64dkd/Ct+hinBEOWY9IWEotArqqPcUrQ695T3IpNXFpSWXNL8MBs5nzTsOquEtwSZL24vCSMp2zDVHKIW4K8VD8L9bNO+r7nf8uaE44JznwJ0gCPY4LSUTfS+Idrgt5XpZ88OOacYGdf4acIkTsn6EXdkp+q99c9QRKWvrGYq3Z2UdAL30RvTN2YUCcFz89pujoEy+l2kNTt6ahgcyD4BBA0AQSfAIJqktoioAntFez7+6h+r1raKhhdmuqTFxi2VHB2q4u9YJxiKwVHfDLC80Po2iiY/foc1fiCRrRQMD/XSdJh3ZjWCfaWfp5GA9rlMz/aJlgxVabBgOGVK4MQomHZr8GUgLXiZ2iV4A+x2qS809pXz3KMbw+1A/HBA/GbRt5IvI2qXpcO674IKl/E9gimRO/+VIriQl4tpX3dVb2/rRGkEw2D+xEh7wPdyMZM5jOliqymJYJzUraT4ZE8+JcfdyAozr8sR0HbIUhHaE3o4yjiZZUDfaZ+kVLNpw2CPTrCrlCuizezbBhWxSlOhYe5BYL0NTqmxf/y0VulmzMXUYojLWDyWY11wZg+ZlVlmfDPDxQR5n4QeSF5iXOhCtuCuYhmdX1rxf9PH18SoLjeWloJovvZFRyJSb7n65S134WLyCRJIJRluiRHJc1Iq4IpLRwUMbB1cSdSySHHkZd5wbMam4K04RcoZ7GI+3Wt4mQkCEqzFJLt+Cy3sieY0DVKlFMfPDEC6HrhZOD9JJ82zWruzQtrgrRsP9VPoRSG2U4cWB4cQ97NW1+AJcGYNvya9EpEPOS5Vx9Invurkx1BUob5G2UEmhNu/CLVbVyS9jGzJEgHu6ybdu5mRT9ZM3hO9pnZEKRl+/4PKxTQCy/UyfPQQuQ7Ni74Sa5SXTgUob/MSXnjD2LH6d6sYEZfpdrZjQXE61U3K57m0UYFV+SUp7+Hx1gJIRndSyhNUjMimNBBSg+tUHKrljZZHSaZmBekjbZjs8KhxOXtanboaGlYMKINv8+HEx03DxpujQp+0NzlmRWI/hAU3RkUpL/m0yGxxsxNCYa0W0nHyi4yOhMTgjHtVhqqp72/nLF+wT3NXepLsBcT6hck/POSoS9/wkRlm/N44fA4BgW/Sp26JjAnONW+kmklxgQNLbdbwpDg0trCVWYEjRcOAhOCG5sLq5kQNFx3yWM7uqQdCD4BBE0AwSf4z69OySJImtaAbkaiUZB10sumuBsh1XgRvKfd5i1kPWvPDo2uxG+BIetM19LVJUZHbF8xieUR+FOkpT5Ml7FbD5JeaJheJmJ1Ovxsfw2Fsq2/2IcozhGwhq4WTTypP7cJdN1AryX3UMtS/owWvIeaP9yTlQcem0V/NGtu89s9gYmPZ50dd4eh2a+7Xb/w9vZj8AtvAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC0gX8BCeRBNY6/4nEAAAAASUVORK5CYII=",
                fit: BoxFit.fill,
              )),
         // HotelItemTextBuilder(text: flight.lineLogo),
          HotelItemTextBuilder(text: flight.lineArabicName),
          HotelItemTextBuilder(text: flight.lineEnglishName),
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
                            color: Colors.cyan
                        ),
                        child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.edit, color: Colors.white,))),
                    SizedBox(width: 5,),
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
                        color: Colors.amberAccent
                    ),
                    child: TextButton(
                        onPressed: ()
                        {
                          AppCubit.get(context).changeScreen(9);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text('Airports',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
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
