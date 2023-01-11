import 'package:bloc/bloc.dart';
import 'package:deedee/ui/help/help_state.dart';
import 'package:flutter/material.dart';
part 'help_event.dart';


class HelpBloc extends Bloc<GetMessagesEvent, GetMessageState> {
  HelpBloc() : super(GetMessageState()) {
    on<GetMessagesEvent>(
        _onGetChat);
  }

  _onGetChat(GetMessagesEvent event, Emitter<GetMessageState> emit)  {
    String eventMessages = event.messages;
    List<String> stateMessages = state.messages;
    List<String> messages = stateMessages + [eventMessages];
    emit(
        GetMessageState(messages: messages)
    );
  }
}

