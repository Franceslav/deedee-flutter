part of 'map_sliding_panel_bloc.dart';

@immutable
abstract class MapSlidingPanelState {}

class MapSlidingPanelInitial extends MapSlidingPanelState {}

class ServiceRequestCreatedState extends MapSlidingPanelState {
  final UUID serviceRequestId;

  ServiceRequestCreatedState(this.serviceRequestId);
}

class MapSlidingPanelIsFavoriteState extends MapSlidingPanelState {
  final bool isFavorite;
  final String? snackbarNotification;

  MapSlidingPanelIsFavoriteState({
    required this.isFavorite,
    this.snackbarNotification,
  });
}

class ErrorState extends MapSlidingPanelState {
  final String errorMessage;

  ErrorState({
    required this.errorMessage,
  });
}
