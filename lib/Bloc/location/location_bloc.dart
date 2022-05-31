import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  String address = "";
  LocationBloc() : super(LocationInitial()) {
    on<GetLocation>((event, emit) {
      // TODO: implement event handler
      address = event.address;
      ShowLocation(address);
    });
    on<Update>((event, emit) {
      ShowLocation(address);
    });
  }
}
