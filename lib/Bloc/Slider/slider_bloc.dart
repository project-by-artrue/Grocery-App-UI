import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/model/slider.dart';
import 'package:meta/meta.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  List<CarouselSlider> carousel = [];
  final dbReferance = FirebaseFirestore.instance.collection("slider");
  SliderBloc() : super(SliderInitial()) {
    on<ShowSider>((event, emit) async {
      if (carousel.isEmpty) {
        emit(SliderDataFetching());
        carousel = [];
        Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
            dbReferance.snapshots();

        snapshot.forEach((data) {
          data.docs.forEach((element) {
            CarouselSlider slide = CarouselSlider.fromJson(element.data());
            carousel.add(slide);
          });
          emitSliderData();
        });
      } else {
        emit(DisplaySliderData(carousel));
      }
    });
  }

  emitSliderData() {
    emit(DisplaySliderData(carousel));
  }

}
