import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'deedee_drawer_state.dart';

class DeedeeDrawerCubit extends Cubit<DeedeeDrawerState> {
  DeedeeDrawerCubit() : super(DeedeeDrawerInitial());

  void showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Link copied'),
      ),
    );
  }
}
