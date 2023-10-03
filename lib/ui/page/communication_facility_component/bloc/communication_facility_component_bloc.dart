// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';

part 'communication_facility_component_event.dart';

part 'communication_facility_component_state.dart';

class CommunicationFacilityComponentBloc extends Bloc<
    CommunicationFacilityComponentEvent, CommunicationFacilityComponentState> {
  CommunicationFacilityComponentBloc()
      : super(CommunicationFacilityComponentStateInitial()) {
    on<AddCommunicationFacilityEvent>(_addCommunicationFacilityEventHandler);
  }

  FutureOr<void> _addCommunicationFacilityEventHandler(
      AddCommunicationFacilityEvent event,
      Emitter<CommunicationFacilityComponentState> emit) {
    print(event.communicationFacility);
    emit(AddCommunicationFacilityComponentState(event.communicationFacility));
  }
}
