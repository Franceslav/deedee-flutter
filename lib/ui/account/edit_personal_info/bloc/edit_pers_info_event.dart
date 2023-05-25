part of 'edit_pers_info_bloc.dart';

// @immutable
abstract class EditPersInfoScreenEvent {}

class EditPersInfoScreenInitLoadEvent extends EditPersInfoScreenEvent {
  final Profile profile;

  EditPersInfoScreenInitLoadEvent({
    required this.profile,
  });
}

class EditPersInfoScreenLoadEvent extends EditPersInfoScreenEvent {
  final User user;
  final LatLng userLocation;

  EditPersInfoScreenLoadEvent({
    required this.user,
    required this.userLocation,
  });
}

class EditPersInfoScreenChangeEvent extends EditPersInfoScreenEvent {
  final User user;
  final Location? city;

  EditPersInfoScreenChangeEvent({
    required this.user,
    required this.city,
  });
}

class GPSEvent extends EditPersInfoScreenEvent {}

class SaveEditDataEvent extends EditPersInfoScreenEvent {
  final Profile profile;

  SaveEditDataEvent({
    required this.profile,
  });
}
