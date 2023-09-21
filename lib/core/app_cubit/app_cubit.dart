import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seasons_dashboard/core/core_models/user_model.dart';
import 'package:seasons_dashboard/features/car_types/presentation/views/car_type_view.dart';
import 'package:seasons_dashboard/features/cities/data/models/city_model.dart';
import 'package:seasons_dashboard/features/countries/data/models/country_model.dart';
import 'package:seasons_dashboard/features/hotels/presentation/views/widgets/add_new_hotel.dart';

import '../../features/airports/presentation/views/airports_view.dart';
import '../../features/airports/presentation/views/widgets/add_new_airport.dart';
import '../../features/booking_history/presentation/views/booking_history_view.dart';
import '../../features/car/presentation/views/add_new_car_view.dart';
import '../../features/car/presentation/views/car_view.dart';
import '../../features/car_reservation/presentation/views/car_reservations_view.dart';
import '../../features/car_types/data/models/car_type_model.dart';
import '../../features/car_types/presentation/views/add_new_car_type_view.dart';
import '../../features/cities/presentation/cities/presentation/views/add_new_city_view.dart';
import '../../features/cities/presentation/cities/presentation/views/cities_view.dart';
import '../../features/controlel_website/presentation/views/control_website_view.dart';
import '../../features/countries/presentation/countries/presentation/views/add_new_country_view.dart';
import '../../features/countries/presentation/countries/presentation/views/countries_view.dart';
import '../../features/dashboard/presentation/views/dashboard_view.dart';
import '../../features/flight_lines/presentation/views/flight_lines_view.dart';
import '../../features/flight_lines/presentation/views/widgets/add_new_flight_line.dart';
import '../../features/flight_reservation/presentation/views/flight_reservations_view.dart';
import '../../features/flight_reservation/presentation/views/widgets/create_flight_reservation.dart';
import '../../features/flights/presentation/views/flights_view.dart';
import '../../features/flights/presentation/views/widgets/add_new_flight.dart';
import '../../features/hotel_reservation/presentation/views/hotel_reservations_view.dart';
import '../../features/hotel_reservation/presentation/views/widgets/hotel_details.dart';
import '../../features/hotels/presentation/views/hotels_view.dart';
import '../../features/notification_center/presentation/views/notification_center_view.dart';
import '../../features/our_programme/presentation/views/add_new_programme_view.dart';
import '../../features/our_programme/presentation/views/our_programme_view.dart';
import '../../features/programme_reservation/presentation/views/programme_reservations_view.dart';
import '../../features/programme_reservation/presentation/views/widgets/create_program_reservation.dart';
import '../../features/users/presentation/admin_users/presentation/views/add_new_user_view.dart';
import '../../features/users/presentation/admin_users/presentation/views/admin_user_view.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool tapped = false;
  int itemIndex = 0;
  List<Widget> screensList = [
    const DashboardView(),
    const AdminUserView(),
    const NotificationCenterView(),
    const OurProgrammeView(),
    const CarView(),
    const CarReservations(),
    const Hotels(),
    const HotelReservations(),
    const FlightLinesView(),
    const AirportsView(),
    const FlightsView(),
    const FlightReservationsView(),
    const ProgrammeReservations(),
    const CountriesView(),
    const CitiesView(),
    const BookingHistoryView(),
    const ControlWebsiteView(),
    const CarTypeView(),
  ];
  changeScreen(int index) {
    tapped = false;
    itemIndex = index;
    tapped = true;
    emit(AppChangeScreenSuccessState());
  }

  bool addNew = false;
  int addNewIndex = -1;
  List<Widget> addNewScreens = [
    const AddNewUser(),
    const AddNewCountry(),
    const AddNewCity(),
    const AddNewProgrammeView(),
    const AddNewCarView(),
    const AddNewHotel(),
    const HotelDetails(),
    const AddNewAirport(), //7
    const AddNewFlightLine(),
    const AddNewFlight(),
    const CreateFlightReservation(),
    const CreateProgramReservation(),
    const AddNewCarTypeView(),
  ];
  List<String> addNewNames = [
    "Add New Uses",
    "Add New Country",
    "Add New City",
    "Add New Programme",
    "Add New Car",
    "Add New Hotels",
    "Hotel Booking",
    "Add New Airport",
    "Add New FlightLine",
    "Add New Flight",
    "Flight Booking",
    "Tourism Programme Search",
    "Add New Car Type",
  ];
  CarTypeModel? carTypeModelC;
  UserModel? userModelC;
  CountryModel? countryModelC;
  CityModel? cityModelC;
  addNewTapped(
    int index, {
    CarTypeModel? carTypeModel,
    UserModel? userModel,
    CountryModel? countryModel,
    CityModel? cityModel,
  }) {
    if (carTypeModel != null) {
      carTypeModelC = carTypeModel;
    }
    if (userModel != null) {
      userModelC = userModel;
    }
    if (countryModel != null) {
      countryModelC = countryModel;
    }
    if (cityModel != null) {
      cityModelC = cityModel;
    }
    addNew = true;
    addNewIndex = index;
    emit(AddNewSuccessState());
  }

  bool isAgent = false;
  checkIfAgent(String agent) {
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    print(agent);
    if (agent == 'Agent') {
      isAgent = true;
      emit(IsAgentSuccessState());
    } else {
      isAgent = false;
      emit(IsAgentSuccessState());
    }
  }

  File? itemImage;
  Uint8List? webImage2;
  var picker = ImagePicker();
  Future<void> getItemImage() async {
    print('object11111111111');
    if (kIsWeb) {
      print('objec555555555');
      await FilePickerWeb.platform
          .pickFiles(
        type: FileType.image,
      )
          .then((value) async {
        print("hi");
        if (value != null) {
          print('objec6666666666');
          webImage2 = value.files.single.bytes!;
          emit(GetImageSuccessState());
        } else {
          print('objec77777777777');
          print("no image selected");
          emit(GetImageErrorState());
        }
        //print(value!.files.single.name);
      }).catchError((error) {
        print('object errooooooooooooo');
        print(error.toString());
      });
      print('objec555555555');
    } else if (Platform.isAndroid || Platform.isIOS) {
      print('object2222222222222');
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        print('object3333333333');

        itemImage = File(pickedFile.path);
        emit(GetImageSuccessState());
      } else {
        print('object4444444444444');

        print("no image selected");
        emit(GetImageErrorState());
      }
    }
  }

  Future<void> pickAndUploadImage() async {
    // Pick an image file using FilePicker
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png'
      ], // Adjust allowed file extensions if needed
    );

    if (result != null) {
      // Extract the image bytes from the picked file
      Uint8List? imageBytes = result.files.single.bytes;

      if (imageBytes != null) {
        // Create FormData object
        FormData formData = FormData.fromMap({
          'image': MultipartFile.fromBytes(
            imageBytes,
            filename: result.files.single.name,
            //contentType: MediaType('image', 'jpeg'), // Adjust the content type if needed
          ),
        });
      }
    }
  }
}
