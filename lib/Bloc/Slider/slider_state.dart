part of 'slider_bloc.dart';

@immutable
abstract class SliderState {}

class SliderInitial extends SliderState {}

class SliderDataFetching extends SliderState {}

class DisplaySliderData extends SliderState {
  List<CarouselSlider> carousel = [];
  DisplaySliderData(this.carousel);
}
