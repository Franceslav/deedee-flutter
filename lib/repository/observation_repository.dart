import 'package:deedee/generated/deedee/api/model/observation.pb.dart';
import 'package:deedee/generated/deedee/api/service/observation_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class ObservationRepository {
  final ObservationServiceClient _observationServiceClient = locator.get<ObservationServiceClient>();
  
  Future<Observation> addObservation(Observation observation) async {
    final response = await _observationServiceClient.addObservation(
      ObservationRequest(
        observation: observation
      ));
    return response.observations.first;
  }
}
