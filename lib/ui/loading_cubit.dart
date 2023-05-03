import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'loading_state.dart';

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit() : super(LoadingInitial());
}
