import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/programme_reservation/presentation/views/widgets/programmes_reservation_body.dart';

import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_states.dart';
import '../../../../core/app_widgets/AddButton.dart';
import '../../../../core/resources_manager/colors_manager.dart';

class ProgrammeReservations extends StatelessWidget {
  const ProgrammeReservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProgramReservation> programReservations=
    [
      ProgramReservation(id: 'id', program: 'program', whereToGo: 'whereToGo', createdBy: 'createdBy', departureDate: 'departureDate', firstName: 'firstName', lastName: 'lastName', noOfAdults: 'noOfAdults', noOfChildren: 'noOfChildren', noOfInfants: 'noOfInfants'),
      ProgramReservation(id: 'id', program: 'program', whereToGo: 'whereToGo', createdBy: 'createdBy', departureDate: 'departureDate', firstName: 'firstName', lastName: 'lastName', noOfAdults: 'noOfAdults', noOfChildren: 'noOfChildren', noOfInfants: 'noOfInfants'),
      ProgramReservation(id: 'id', program: 'program', whereToGo: 'whereToGo', createdBy: 'createdBy', departureDate: 'departureDate', firstName: 'firstName', lastName: 'lastName', noOfAdults: 'noOfAdults', noOfChildren: 'noOfChildren', noOfInfants: 'noOfInfants'),
      ProgramReservation(id: 'id', program: 'program', whereToGo: 'whereToGo', createdBy: 'createdBy', departureDate: 'departureDate', firstName: 'firstName', lastName: 'lastName', noOfAdults: 'noOfAdults', noOfChildren: 'noOfChildren', noOfInfants: 'noOfInfants'),
      ProgramReservation(id: 'id', program: 'program', whereToGo: 'whereToGo', createdBy: 'createdBy', departureDate: 'departureDate', firstName: 'firstName', lastName: 'lastName', noOfAdults: 'noOfAdults', noOfChildren: 'noOfChildren', noOfInfants: 'noOfInfants'),
    ];
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          if(cubit.addNewIndex == 11) {
            return cubit.addNewScreens[11];
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
                      text: 'Create Programme Reservation',
                      onTap: ()
                      {
                        AppCubit.get(context).addNewTapped(11);

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
                  AddressRow9(
                    flightReservations: programReservations,
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
