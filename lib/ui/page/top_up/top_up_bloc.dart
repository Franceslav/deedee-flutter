import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/account.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/account_repository.dart';
import 'package:deedee/ui/page/top_up/top_up_event.dart';
import 'package:flutter/material.dart';

part 'top_up_state.dart';

class TopUpBloc extends Bloc<TopUpEvent, TopUpState> {
  final User user;

  TopUpBloc(this.user) : super(TopUpInitial()) {
    on<TopUpActionEvent>((event, emit) async {
      final response = await locator
          .get<AccountRepository>()
          .create(Account()..balance.first.value = event.amount);
      bool succeed = response.balance.first.value == event.amount;

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
