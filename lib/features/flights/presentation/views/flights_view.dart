import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/flight_lines/presentation/views/widgets/flight_line_body.dart';
import 'package:seasons_dashboard/features/flights/presentation/views/widgets/flights_body.dart';

import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_states.dart';
import '../../../../core/app_widgets/AddButton.dart';
import '../../../../core/resources_manager/colors_manager.dart';

class FlightsView extends StatelessWidget {
  const FlightsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Flight> flights=
    [
      Flight(line: 'line', goingFrom: 'goingFrom', arrivalIn: 'arrivalIn', departureDate: 'departureDate', returnDate: 'returnDate', isAvailable: 'isAvailable', isRoundTrip: 'isRoundTrip', adultPrice: 'adultPrice', childPrice: 'childPrice', infantPrice: 'infantPrice', ticketsCount: 'ticketsCount', availableTickets: 'availableTickets'),
      Flight(line: 'line', goingFrom: 'goingFrom', arrivalIn: 'arrivalIn', departureDate: 'departureDate', returnDate: 'returnDate', isAvailable: 'isAvailable', isRoundTrip: 'isRoundTrip', adultPrice: 'adultPrice', childPrice: 'childPrice', infantPrice: 'infantPrice', ticketsCount: 'ticketsCount', availableTickets: 'availableTickets'),
      Flight(line: 'line', goingFrom: 'goingFrom', arrivalIn: 'arrivalIn', departureDate: 'departureDate', returnDate: 'returnDate', isAvailable: 'isAvailable', isRoundTrip: 'isRoundTrip', adultPrice: 'adultPrice', childPrice: 'childPrice', infantPrice: 'infantPrice', ticketsCount: 'ticketsCount', availableTickets: 'availableTickets'),
      Flight(line: 'line', goingFrom: 'goingFrom', arrivalIn: 'arrivalIn', departureDate: 'departureDate', returnDate: 'returnDate', isAvailable: 'isAvailable', isRoundTrip: 'isRoundTrip', adultPrice: 'adultPrice', childPrice: 'childPrice', infantPrice: 'infantPrice', ticketsCount: 'ticketsCount', availableTickets: 'availableTickets'),
      Flight(line: 'line', goingFrom: 'goingFrom', arrivalIn: 'arrivalIn', departureDate: 'departureDate', returnDate: 'returnDate', isAvailable: 'isAvailable', isRoundTrip: 'isRoundTrip', adultPrice: 'adultPrice', childPrice: 'childPrice', infantPrice: 'infantPrice', ticketsCount: 'ticketsCount', availableTickets: 'availableTickets'),
    ];
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          if(cubit.addNewIndex == 9) {
            return cubit.addNewScreens[9];
          }
          else {
            return
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20.0),
                    child: AddButton(
                      text: 'Add New Flight',
                      onTap: ()
                      {
                        AppCubit.get(context).addNewTapped(9);

                      },
                      color: ColorsManager.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AddressRow6(
                    flights: flights,
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                ],
              );
          }
        });

  }
}
