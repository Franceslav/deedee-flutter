import 'package:deedee/generated/deedee/api/model/observation.pb.dart';
import 'package:deedee/generated/deedee/api/model/geolocation.pb.dart';
import 'package:deedee/generated/deedee/api/service/observation_service.pbgrpc.dart';
import '../services/fake/mock_observation_service_client.dart'; // Temporary
import 'package:deedee/injection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class ObservationRepository {
  final ObservationServiceClient _observationServiceClient = locator.get<ObservationServiceClient>();

  Future<Observation> addObservation(
    {required Int64 observationId, 
    required Int64 userId, 
    required double latitude, 
    required double longitude}
    ) async {
    final response = await _observationServiceClient.addObservation(ObservationRequest(
      observation: Observation(
        observationId: observationId,
        userId: userId,
        geolocation: Geolocation()
            ..latitude = latitude
            ..longitude = longitude,
      )
    ));
    return response.observations.first;
  }
}
