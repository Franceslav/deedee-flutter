part of 'edit_pers_info_bloc.dart';

// @immutable
abstract class EditPersInfoScreenEvent {}

class EditPersInfoScreenInitLoadEvent extends EditPersInfoScreenEvent {
  final Profile profile;

  EditPersInfoScreenInitLoadEvent({
    required this.profile,
  });
}

class EditPersInfoScreenLoadEvent extends EditPersInfoScreenEvent {}

class EditPersInfoScreenChangeEvent extends EditPersInfoScreenEvent {}
class SaveEditDataEvent extends EditPersInfoScreenEvent {
  final Profile profile;

  SaveEditDataEvent({
    required this.profile,
  });
}
