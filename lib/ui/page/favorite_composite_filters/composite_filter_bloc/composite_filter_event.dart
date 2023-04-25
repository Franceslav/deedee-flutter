part of 'composite_filter_bloc.dart';

@immutable
abstract class CompositeFilterEvent {}

class CompositeFilterCreateEvent extends CompositeFilterEvent {
  final CompositeFilter compositeFilter;

  CompositeFilterCreateEvent(this.compositeFilter);
}

class CompositeFilterSubscribeEvent extends CompositeFilterEvent {
  final Int64 compositeFilterId;

  CompositeFilterSubscribeEvent({required this.compositeFilterId});
}

class CompositeFilterDeleteEvent extends CompositeFilterEvent {
  final CompositeFilter compositeFilter;
  final int index;

  CompositeFilterDeleteEvent({
    required this.compositeFilter,
    required this.index,
  });
}
