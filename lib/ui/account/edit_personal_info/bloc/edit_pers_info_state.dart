
part of 'edit_pers_info_bloc.dart';

// @immutable
abstract class EditPersInfoScreenState {}

class EditPersInfoScreenInitialState extends EditPersInfoScreenState {}

class EditPersInfoScreenLoadingState extends EditPersInfoScreenState {
  final Profile profile;

  EditPersInfoScreenLoadingState({
    required this.profile
  }); 
}

class EditPersInfoScreenFirstLaunchState extends EditPersInfoScreenState {}

class EditPersInfoScreenFailureState extends EditPersInfoScreenState {
  final String errorMessage;

  EditPersInfoScreenFailureState({required this.errorMessage});
}

class EditPersInfoScreenLoadedState extends EditPersInfoScreenState {
  final Location? selectedCity;
  final List<Topic> topics;

  EditPersInfoScreenLoadedState({
    required this.topics,
    required this.selectedCity,
  });
}

class EditPersInfoScreenAccountTypeChangedState extends EditPersInfoScreenState {}

class EditPersInfpScreenDataChangedState extends EditPersInfoScreenState {
  final Profile profile;
 
  EditPersInfpScreenDataChangedState({
    required this.profile,
  });

}