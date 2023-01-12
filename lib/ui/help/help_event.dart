part of 'help_bloc.dart';

@immutable
abstract class HelpEvent {}

class MessageReceivedEvent extends HelpEvent {
  final String messages;

  MessageReceivedEvent(this.messages);
}
