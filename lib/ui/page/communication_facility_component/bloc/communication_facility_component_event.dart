// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'communication_facility_component_bloc.dart';

abstract class CommunicationFacilityComponentEvent {}

class AddCommunicationFacilityEvent extends CommunicationFacilityComponentEvent {
  final String communicationFacility;

  AddCommunicationFacilityEvent(this.communicationFacility);
}