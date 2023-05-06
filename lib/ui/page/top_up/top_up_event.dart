import 'package:deedee/model/user.dart';

abstract class TopUpEvent {}

class TopUpActionEvent extends TopUpEvent {
  final double amount;

  TopUpActionEvent(this.amount);
}

class TopUpDoneEvent extends TopUpEvent {}

class TopUpFilterChangeEvent extends TopUpEvent {
  final Map<String, bool> predefinedTopUpActiveMap;
  final AccountType accountType;

  TopUpFilterChangeEvent(this.predefinedTopUpActiveMap, this.accountType);
}
