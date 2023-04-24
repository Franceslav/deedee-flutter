part of 'map_sliding_panel_bloc.dart';

@immutable
abstract class MapSlidingPanelState {}

class MapSlidingPanelInitial extends MapSlidingPanelState {}

class MapSlidingPanelCreateRequestState extends MapSlidingPanelState {
  final ServiceRequest request;

  MapSlidingPanelCreateRequestState(this.request);
}

class ErrorState extends MapSlidingPanelState {
  final String errorMessage;

  ErrorState({
    required this.errorMessage,
  });
}
