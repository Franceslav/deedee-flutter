part of 'top_up_bloc.dart';

abstract class TopUpState {}

class TopUpInitial extends TopUpState {}

class ValidTopUpField extends TopUpState {}

class TopUpFailureState extends TopUpState {
  String errorMessage;

  TopUpFailureState({required this.errorMessage});
}

class TopUpDoneState extends TopUpState {
  final bool succeed;

  TopUpDoneState(this.succeed);
}

class TopUpFilterChangeState extends TopUpState {
  final Map<String, bool> predefinedFilterActiveMap;
  final AccountType accountType;

  TopUpFilterChangeState(this.predefinedFilterActiveMap, this.accountType);
}
