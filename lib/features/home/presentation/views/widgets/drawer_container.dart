import 'package:flutter/material.dart';

import 'drawer_container_item.dart';

class DrawerContainer extends StatefulWidget {
  const DrawerContainer({Key? key}) : super(key: key);

  @override
  State<DrawerContainer> createState() => _DrawerContainerState();
}

List<Map<String, dynamic>> list = [
  {'icon': Icons.dashboard_outlined, 'text': 'Dashboard'},
  {'icon': Icons.person_outline, 'text': 'Administration Users'},
  {'icon': Icons.person_outline, 'text': 'Notification Center'},
  {'icon': Icons.border_all_outlined, 'text': 'Our Programms'},
  {'icon': Icons.directions_car_outlined, 'text': 'Car'},
  {'icon': Icons.public_outlined, 'text': 'Car Reservations'},
  {'icon': Icons.hotel_outlined, 'text': 'Hotels'},
  {'icon': Icons.public_outlined, 'text': 'Hotel Reservations'},
  {'icon': Icons.public_outlined, 'text': 'Flight Lines'},
  {'icon': Icons.public_outlined, 'text': 'Airports'},
  {'icon': Icons.public_outlined, 'text': 'Flights'},
  {'icon': Icons.public_outlined, 'text': 'Flight Reservations'},
  {'icon': Icons.public_outlined, 'text': 'Programme Reservations'},
  {'icon': Icons.public_outlined, 'text': 'Countries'},
  {'icon': Icons.public_outlined, 'text': 'Cities'},
  {'icon': Icons.calendar_today_outlined, 'text': 'Booking History'},
  {'icon': Icons.public_outlined, 'text': 'Control Website'},
  {'icon': Icons.directions_bus, 'text': 'Car Types'},
];

class _DrawerContainerState extends State<DrawerContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      //height: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 8.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Item(
            text: list[index]['text'],
            icon: list[index]['icon'],
            index: index,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: list.length,
      ),
    );
  }
}
// Container(
//   color: Colors.grey[100],
//   height: 50,
//   width: 300,
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.settings_outlined,
//             color: Colors.grey,
//           )),
//       IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.email_outlined,
//             color: Colors.grey,
//           )),
//       IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.power_settings_new_outlined,
//             color: Colors.grey,
//           )),
//     ],
//   ),
// )
