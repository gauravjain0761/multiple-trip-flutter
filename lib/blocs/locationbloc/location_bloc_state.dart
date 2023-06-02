part of 'location_bloc_bloc.dart';

@immutable
abstract class LocationBlocState {}

class LocationBlocInitial extends LocationBlocState {}

class SuggestionsLoading extends LocationBlocState {}

class SuggestionsLoaded extends LocationBlocState {
  final List<lc.Prediction> predictions;
  SuggestionsLoaded({required this.predictions});
}

class SuggestionError extends LocationBlocState {
  final String error;
  SuggestionError({required this.error});
}

class PickupLatLongLoading extends LocationBlocState {}

class PickupLatLongLoaded extends LocationBlocState {
  final LatLng picklatlong;
  PickupLatLongLoaded({required this.picklatlong});
}

class DropLatLongLoading extends LocationBlocState {}

class DropLatLongLoaded extends LocationBlocState {
  final LatLng latLng;
  DropLatLongLoaded({required this.latLng});
}
