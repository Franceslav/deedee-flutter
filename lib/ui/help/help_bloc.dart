import 'package:bloc/bloc.dart';
import 'package:deedee/ui/help/help_state.dart';
import 'package:flutter/material.dart';
part 'help_event.dart';


class HelpBloc extends Bloc<MessageReceivedEvent, GetMessageState> {
  HelpBloc() : super(GetMessageState()) {
    on<MessageReceivedEvent>(
        _onMessageReceived);
  }

  _onMessageReceived(MessageReceivedEvent event, Emitter<GetMessageState> emit)  {
    String eventMessages = event.messages;
    List<String> stateMessages = state.messages;
    if(event.messages == '') return;
    List<String> messages = stateMessages + [eventMessages];
    emit(
        GetMessageState(messages: messages)
    );
  }
}

