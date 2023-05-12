part of 'business_bloc.dart';

@immutable
abstract class BusinessState {}
class BusinessStateInitialState extends BusinessState {}
class BusinessPageState extends BusinessState {
  final bool policyAccepted;
  final bool buttonConnectBusiness;
  BusinessPageState(this.policyAccepted, this.buttonConnectBusiness);
}

class ButtonConnectTapInitialState extends BusinessState {}
class BusinessConnectTapState extends BusinessState{
  final bool buttonConnectBusiness;
  BusinessConnectTapState(this.buttonConnectBusiness);
}