import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/flight_reservation/presentation/views/widgets/flights_reservation_body.dart';

import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_states.dart';
import '../../../../core/app_widgets/AddButton.dart';
import '../../../../core/resources_manager/colors_manager.dart';

class FlightReservationsView extends StatelessWidget {
  const FlightReservationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FlightReservation> flightReservations=
    [
      FlightReservation(goingFrom: 'goingFrom', arrivalIn: 'arrivalIn', departureDate: 'departureDate', returnFrom: 'returnFrom', returnTo: 'returnTo', returnDate: 'returnDate', firstName: 'firstName', lastName: 'lastName', noOfAdults: 'noOfAdults', noOfChildren: 'noOfChildren', noOfInfants: 'noOfInfants'),
      FlightReservation( goingFrom: 'goingFrom', arrivalIn: 'arrivalIn', departureDate: 'departureDate', returnFrom: 'returnFrom', returnTo: 'returnTo', returnDate: 'returnDate', firstName: 'firstName', lastName: 'lastName', noOfAdults: 'noOfAdults', noOfChildren: 'noOfChildren', noOfInfants: 'noOfInfants'),
      FlightReservation( goingFrom: 'goingFrom', arrivalIn: 'arrivalIn', departureDate: 'departureDate', returnFrom: 'returnFrom', returnTo: 'returnTo', returnDate: 'returnDate', firstName: 'firstName', lastName: 'lastName', noOfAdults: 'noOfAdults', noOfChildren: 'noOfChildren', noOfInfants: 'noOfInfants'),
      FlightReservation( goingFrom: 'goingFrom', arrivalIn: 'arrivalIn', departureDate: 'departureDate', returnFrom: 'returnFrom', returnTo: 'returnTo', returnDate: 'returnDate', firstName: 'firstName', lastName: 'lastName', noOfAdults: 'noOfAdults', noOfChildren: 'noOfChildren', noOfInfants: 'noOfInfants'),
    ];
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          if(cubit.addNewIndex == 10) {
            return cubit.addNewScreens[10];
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
                      text: 'Create New Reservation',
                      onTap: ()
                      {
                        AppCubit.get(context).addNewTapped(10);

                      },
                      color: ColorsManager.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text('Only current reservations that are still in progress are shown',
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.blueGrey),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  AddressRow7(
                    flightReservations: flightReservations,
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
