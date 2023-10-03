part of 'communication_facility_component_bloc.dart';

abstract class CommunicationFacilityComponentState {}

class CommunicationFacilityComponentStateInitial extends CommunicationFacilityComponentState {}

class AddCommunicationFacilityComponentState extends CommunicationFacilityComponentState {
  final String communicationFacility;

  AddCommunicationFacilityComponentState(this.communicationFacility);
}
