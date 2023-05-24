import 'package:deedee/generated/deedee/api/model/profile.pb.dart';
import 'package:deedee/generated/deedee/api/service/profile_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/profile_service_api.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileServiceClient, env: [Environment.dev])
class MockProfileServiceClient implements ProfileServiceClient {
  ProfileServiceApi api = locator.get<ProfileServiceApi>();

  @override
  ClientCall<Q, R> $createCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests,
      {CallOptions? options}) {
    // TODO: implement $createCall
    throw UnimplementedError();
  }

  @override
  ResponseStream<R> $createStreamingCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests,
      {CallOptions? options}) {
    // TODO: implement $createStreamingCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<R> $createUnaryCall<Q, R>(ClientMethod<Q, R> method, Q request,
      {CallOptions? options}) {
    // TODO: implement $createUnaryCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<ProfileResponse> createProfile(
      ProfileRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
      FakeClientCall<dynamic, ProfileResponse>(
        _createProfile(request),
      ),
    );
  }

  Future<ProfileResponse> _createProfile (ProfileRequest request) async {
    return ProfileResponse();
  }

  @override
  ResponseFuture<ProfileResponse> getProfile(
      ProfileRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
      FakeClientCall<dynamic, ProfileResponse>(
        _getProfile(request),
      ),
    );
  }

  Future<ProfileResponse> _getProfile (ProfileRequest request) async {
    return ProfileResponse(
        profile: api.getProfile(
          Profile(
            profileId: request.profile.profileId,
          )
        )
    );
  }


  @override
  ResponseFuture<ProfileResponse> editProfile(
      ProfileRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
      FakeClientCall<dynamic, ProfileResponse>(
        _editProfile(request),
      ),
    );
  }

  Future<ProfileResponse> _editProfile (ProfileRequest request) async {
      return ProfileResponse(
        profile: api.editProfile(
          Profile(
            profileId: request.profile.profileId,
            username: request.profile.username,
          )
        )
      );
  }

  @override
  ResponseFuture<ProfileResponse> removeProfile(
      ProfileRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
      FakeClientCall<dynamic, ProfileResponse>(
        _removeProfile(request),
      ),
    );
  }

  Future<ProfileResponse> _removeProfile (ProfileRequest request) async {
    return ProfileResponse(
      profile: api.removeProfile(
        Profile(
          profileId: request.profile.profileId,
        )
      )
    );
  }
}
