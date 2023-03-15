part of 'selector_bloc.dart';

abstract class SelectorEvent {}

class LoadTopicsEvent extends SelectorEvent {
  final LatLng location;

  LoadTopicsEvent(this.location);
}

class SelectTopicEvent extends SelectorEvent {
  final String topic;
  SelectTopicEvent(this.topic);
}

class LoadFilterKeysEvent extends SelectorEvent {
  final String topic;

  LoadFilterKeysEvent(this.topic);
}

class SelectFilterKeyEvent extends SelectorEvent {
  final String filterKey;
  SelectFilterKeyEvent(this.filterKey);
}

class SelectListFilterKeyEvent extends SelectorEvent {
  final List<String> listFilterKey;
  SelectListFilterKeyEvent(this.listFilterKey);
}

class SelectDurationEvent extends SelectorEvent {
  final bool userChoseDuration;
  SelectDurationEvent(this.userChoseDuration);
}

class SelectLocationEvent extends SelectorEvent {
  final AddressModel data;

  SelectLocationEvent(this.data);
}

class PushFiltersEvent extends SelectorEvent {
  final String topic;
  final List<String> filterKeys;
  final AccountType accountType;

  PushFiltersEvent({
    required this.topic,
    required this.filterKeys,
    required this.accountType,
  });
}

class SaveFiltersEvent extends SelectorEvent {
  final String topic;
  final String subtopic;
  final List<String> filterKeys;
  final bool isSubscribe;
  final AccountType accountType;
  final String userId;

  SaveFiltersEvent({
    required this.topic,
    required this.subtopic,
    required this.filterKeys,
    required this.isSubscribe,
    required this.accountType,
    required this.userId,
  });
}

class PushTagEvent extends SelectorEvent {
  final AccountType accountType;
  final String topic;
  final String messengerId;
  final LatLng location;
  final List<String> filterKeys;

  PushTagEvent({
    required this.accountType,
    required this.topic,
    required this.messengerId,
    required this.location,
    required this.filterKeys,
  });
}

class DurationSelectedEvent extends SelectorEvent {
  final double duration;

  DurationSelectedEvent({required this.duration});
}

class SelectFirstLvlTopicEvent extends SelectorEvent {
  final String topic;
  SelectFirstLvlTopicEvent(this.topic);
}
