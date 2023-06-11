import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/observation.pb.dart';
import 'package:deedee/services/fake/api/tag_service_api.dart';
import 'package:fixnum/fixnum.dart';
import '../../../generated/deedee/api/model/tag.pb.dart';
part 'count_view_event.dart';
part 'count_view_state.dart';

class CountViewBloc extends Bloc<CountVewEvent, CountViewState> {
  TagServiceApi tagServiceApi;
  CountViewBloc(
    this.tagServiceApi,
  ) : super(InitialState()) {
    on<CountVewEvent>(_onTapSlidingPanelTag);
  }

  _onTapSlidingPanelTag(
      CountVewEvent event, Emitter<CountViewState> emit) async {
      Observation observation = Observation(
      observationId: Int64(DateTime.now().microsecondsSinceEpoch),
      userId: Int64(1),
      geolocation: event.tag.geolocation,
    );
    event.tag.observations.add(observation);
  }
}
