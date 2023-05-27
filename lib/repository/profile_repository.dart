import 'package:deedee/generated/deedee/api/model/profile.pb.dart';
import 'package:deedee/generated/deedee/api/service/profile_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class ProfileRepository {
  final ProfileServiceClient _profileServiceClient =
      locator.get<ProfileServiceClient>();

  
  Future<void> createProfile(Profile profile, {CallOptions? options}) async {
    await _profileServiceClient.createProfile(
      ProfileRequest(
        profile: profile,
      ));
  }
  
  Future<Profile> getProfile(String userId, {CallOptions? options}) async {
    ProfileResponse response = await _profileServiceClient.getProfile(
      ProfileRequest(
        profile: Profile(
          userId: userId),
      ));
    return response.profile;
  }
  
  Future<Profile> editProfile(String email, String username, {CallOptions? options}) async {
    ProfileResponse response = await _profileServiceClient.editProfile(
      ProfileRequest(
        profile: Profile(
          userId: email,
          username: username),
      ));
    return response.profile;
  }
  Future<Profile> removeProfile(Profile profile, {CallOptions? options}) async {
    ProfileResponse response = await _profileServiceClient.removeProfile(
      ProfileRequest(
        profile: profile,
      ));
    return response.profile;
  }
}
