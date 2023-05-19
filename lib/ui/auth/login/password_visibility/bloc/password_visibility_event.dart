// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'password_visibility_bloc.dart';

@immutable
abstract class PasswordVisibilityEvent {}

class TogglePasswordShownEvent extends PasswordVisibilityEvent {
  final bool visibility;
  TogglePasswordShownEvent(this.visibility);
}
