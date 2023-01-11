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
    print(event.messages);
    print(state.messages);
         var messages = state.messages.add(event.messages);
    // List<String> messages = ['Привет', 'Как пополнить счет?'];

    emit(
        GetMessageState(messages: messages)

    );
  }
}

