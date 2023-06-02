part of 'business_bloc.dart';

@immutable
abstract class BusinessEvent {}

class PolicyCheckedEvent extends BusinessEvent{
  final bool policyAccepted;
  PolicyCheckedEvent(this.policyAccepted);
}

class ButtonConnectEvent extends BusinessEvent{
  final bool policyAccepted;
  final bool buttonConnectBusiness;
  ButtonConnectEvent(this.policyAccepted, this.buttonConnectBusiness);
}

class ChangeFormEvent extends BusinessEvent{
  final String formValue;
  ChangeFormEvent(this.formValue);
}