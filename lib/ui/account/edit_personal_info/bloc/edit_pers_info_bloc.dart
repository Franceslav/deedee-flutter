import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/location.pb.dart';
import 'package:deedee/generated/deedee/api/model/topic.pb.dart';
import 'package:deedee/generated/deedee/api/model/profile.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/profile_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

part 'edit_pers_info_event.dart';
part 'edit_pers_info_state.dart';

class EditPersInfoBloc
    extends Bloc<EditPersInfoScreenEvent, EditPersInfoScreenState> {
  final ProfileRepository _profileRepository;

  EditPersInfoBloc(
    this._profileRepository,
  ) : super(EditPersInfoScreenInitialState()) {
    on<EditPersInfoScreenInitLoadEvent>(_onInitLoadEvent);
    on<EditPersInfoScreenChangeEvent>(_onChange);
    on<SaveEditDataEvent>(_onSave);
    _init();
  }
  _init() async {
    emit(EditPersInfoScreenInitialState());
  }

  _onInitLoadEvent(EditPersInfoScreenInitLoadEvent event,
      Emitter<EditPersInfoScreenState> emit) async {
    final profile = await _profileRepository.getProfile(
      event.profile,
    );
    emit(EditPersInfoScreenLoadingState(profile: profile));
  }

  _onChange(EditPersInfoScreenChangeEvent event,
      Emitter<EditPersInfoScreenState> emit) async {}

  _onSave(
      SaveEditDataEvent event, Emitter<EditPersInfoScreenState> emit) async {
    try {
      await _profileRepository.editProfile(
        event.profile,
      );
      emit(EditPersInfpScreenDataChangedState(profile: event.profile));
    } catch (error) {
      emit(EditPersInfoScreenFailureState(errorMessage: error.toString()));
    }
  }
}
