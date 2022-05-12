part of 'location_bloc.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class ShowLocation extends LocationState {
  String address;
  ShowLocation(this.address);
}
