import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_visibility_event.dart';
part 'password_visibility_state.dart';

class PasswordVisibilityBloc
    extends Bloc<PasswordVisibilityEvent, PasswordVisibilityState> {
  PasswordVisibilityBloc() : super(PasswordVisibilityInitial()) {
    on<TogglePasswordShownEvent>(_onToggleChange);
  }
  bool showPassword = false;

  void _onToggleChange(
    TogglePasswordShownEvent event,
    Emitter<PasswordVisibilityState> emit,
  ) async {
    emit(PasswordShownState(visibility: showPassword));
  }
}
