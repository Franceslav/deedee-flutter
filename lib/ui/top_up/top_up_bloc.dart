import 'package:bloc/bloc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/grpc.dart';
import 'package:deedee/ui/top_up/top_up_event.dart';
import 'package:flutter/material.dart';

part 'top_up_state.dart';

class TopUpBloc extends Bloc<TopUpEvent, TopUpState> {
  final User user;

  TopUpBloc(this.user) : super(TopUpInitial()) {
    on<TopUpActionEvent>((event, emit) async {
      bool succeed = await locator.get<GRCPRepository>().topUpAccount(event.amount);
      emit(TopUpDoneState(succeed));
    });
  }

  checkValidField(GlobalKey<FormState> key) {
    if (key.currentState?.validate() ?? false) {
      key.currentState!.save();
      emit(ValidTopUpField());
    } else {
      emit(TopUpFailureState(errorMessage: 'Invalid instagram id.'));
    }
  }
}
