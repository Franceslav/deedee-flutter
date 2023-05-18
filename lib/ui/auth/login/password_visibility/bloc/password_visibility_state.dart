// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'password_visibility_bloc.dart';

@immutable
abstract class PasswordVisibilityState {}

class PasswordVisibilityInitial extends PasswordVisibilityState {}

class PasswordShownState extends PasswordVisibilityState {
  final bool visibility;

  PasswordShownState({
    required this.visibility,
  });
}
