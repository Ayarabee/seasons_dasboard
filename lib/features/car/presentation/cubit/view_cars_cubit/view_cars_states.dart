
import 'package:seasons_dashboard/features/car/data/models/car_model.dart';

abstract class ViewCarsStates {}

class ViewCarsInitialState extends ViewCarsStates {}

class ViewCarsLoadingState extends ViewCarsStates {}

class ViewCarsSuccessState extends ViewCarsStates
{
  List <CarModel> cars =[];
  ViewCarsSuccessState(this.cars);
}
class ViewCarsErrorState extends ViewCarsStates
{
  String error;
  ViewCarsErrorState(this.error);
}
