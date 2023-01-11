part of 'help_bloc.dart';

@immutable
abstract class HelpEvent {}

class GetMessagesEvent extends HelpEvent {
  final String messages;

  GetMessagesEvent(this.messages);
}

