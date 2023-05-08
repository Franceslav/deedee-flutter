import 'package:deedee/generated/deedee/api/model/observation.pb.dart';
import 'package:deedee/generated/deedee/api/model/geolocation.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class ObservationServiceApi {
  late List<Observation> _observations;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _observations = [
        Observation(
          observationId: Int64(0),
          userId: Int64(1),
          geolocation: Geolocation(),
        ),
      ];
  }

  Observation createObservation(Observation observationArg) {
      Observation observation = Observation(
            observationId: observationArg.observationId,
            userId: observationArg.userId,
            geolocation: observationArg.geolocation,
          );
      _observations.add(observation);
      return observation;
  }

  List<Observation> readObservations() =>_observations;

  Observation updateObservation(Observation observationArg) {
    Observation observation =_observations
        .firstWhere((o) => o.observationId == observationArg.observationId, 
          orElse: () => Observation(
            observationId: observationArg.observationId,
            userId: observationArg.userId,
            geolocation: observationArg.geolocation,
          ));
    observation.userId = observationArg.userId;
    observation.geolocation = observationArg.geolocation; 
    return observation;
  }

  // TODO: Delete
}

  
