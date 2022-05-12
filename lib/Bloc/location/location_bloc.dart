import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    String address = "";
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
