part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {}

class GetLocation extends LocationEvent {
  String address;
  GetLocation(this.address);
}
class Update extends LocationEvent{}
