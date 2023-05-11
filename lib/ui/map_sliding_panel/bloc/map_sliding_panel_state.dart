part of 'map_sliding_panel_bloc.dart';

@immutable
abstract class MapSlidingPanelState {}

class MapSlidingPanelInitial extends MapSlidingPanelState {}

class ServiceRequestCreatedState extends MapSlidingPanelState {
  final Int64 serviceRequestId;

  ServiceRequestCreatedState(this.serviceRequestId);
}

class MapSlidingPanelIsBookmarkedState extends MapSlidingPanelState {
  final bool isBookmarked;
  final String? snackbarNotification;

  MapSlidingPanelIsBookmarkedState({
    required this.isBookmarked,
    this.snackbarNotification,
  });
}

class ErrorState extends MapSlidingPanelState {
  final String errorMessage;

  ErrorState({
    required this.errorMessage,
  });
}
