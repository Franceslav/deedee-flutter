
part of 'edit_pers_info_bloc.dart';

// @immutable
abstract class EditPersInfoScreenState {}

class EditPersInfoScreenInitialState extends EditPersInfoScreenState {}

class EditPersInfoScreenLoadedState extends EditPersInfoScreenState {
  final Profile profile;
 
  EditPersInfoScreenLoadedState({
    required this.profile,
  });
}

class EditPersInfoScreenFailureState extends EditPersInfoScreenState {
  final String errorMessage;

  EditPersInfoScreenFailureState({required this.errorMessage});
}

class EditPersInfoScreenAccountTypeChangedState extends EditPersInfoScreenState {}

class EditPersInfpScreenDataChangedState extends EditPersInfoScreenState {
  final Profile profile;
 
  EditPersInfpScreenDataChangedState({
    required this.profile,
  });

}