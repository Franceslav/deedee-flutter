import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/profile.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/profile_repository.dart';

part 'edit_pers_info_event.dart';
part 'edit_pers_info_state.dart';

class EditPersInfoBloc
    extends Bloc<EditPersInfoScreenEvent, EditPersInfoScreenState> {
  final ProfileRepository _profileRepository;
  final User user;

  EditPersInfoBloc(
    this.user,
    this._profileRepository,
  ) : super(EditPersInfoScreenInitialState()) {
    on<EditPersInfoScreenChangeEvent>(_onChange);
    on<SaveEditDataEvent>(_onSave);
    _init();
  }
  _init() async {
    final getProfileResult = await _profileRepository.getProfile(user.email);
    emit(EditPersInfoScreenLoadedState(profile: getProfileResult));
  }

  _onChange(EditPersInfoScreenChangeEvent event,
      Emitter<EditPersInfoScreenState> emit) async {}

  _onSave(
      SaveEditDataEvent event, Emitter<EditPersInfoScreenState> emit) async {
    try {
     final editProfileResult = await _profileRepository.editProfile(
        user.email,
        event.username,
      );
      emit(EditPersInfpScreenDataChangedState(profile: editProfileResult));
    } catch (error) {
      emit(EditPersInfoScreenFailureState(errorMessage: error.toString()));
    }
  }
}
