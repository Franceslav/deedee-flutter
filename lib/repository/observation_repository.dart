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
  final MockObservationServiceClient _mockObservationServiceClient = locator.get<MockObservationServiceClient>(); // Temporary


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

  Future<List<Observation>> getObservations() async {
    final observations = await _mockObservationServiceClient.getObservations(ObservationRequest());
    return observations.observations;
  }

  Future<Observation> updateObservation(
    {required Int64 observationId, 
    required Int64 userId, 
    required double latitude, 
    required double longitude}
    ) async {
    final observation = await _mockObservationServiceClient.updateObservation(
      ObservationRequest(
        observation: Observation(
          observationId: observationId,
          userId: userId,
          geolocation: Geolocation()
            ..latitude = latitude
            ..longitude = longitude,
        ),
      )
    );
    return observation.observations.first;
  }
}
