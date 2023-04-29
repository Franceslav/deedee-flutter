part of 'map_sliding_panel_bloc.dart';

@immutable
abstract class MapSlidingPanelEvent {}

class MapSlidingPanelRequestCreate extends MapSlidingPanelEvent {
  final Int64 selectedTagId;
  final BuildContext context;

  MapSlidingPanelRequestCreate(this.selectedTagId, this.context);


}
