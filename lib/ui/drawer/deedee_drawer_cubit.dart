import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'deedee_drawer_state.dart';

class DeedeeDrawerCubit extends Cubit<DeedeeDrawerState> {
  DeedeeDrawerCubit() : super(DeedeeDrawerInitial());
}
