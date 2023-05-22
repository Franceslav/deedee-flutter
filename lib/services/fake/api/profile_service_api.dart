// import 'package:deedee/generated/deedee/api/model/geolocation.pb.dart';
import 'package:deedee/generated/deedee/api/model/profile.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class ObservationServiceApi {
  late List<Profile> _profiles;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _profiles = [

    ];
  }

  Profile createProfile(Profile profileArg) {
    Profile profile = Profile(
      profileId: profileArg.profileId,
      referredBy: profileArg.referredBy,
      username: profileArg.username,
      contacts: profileArg.contacts,
      status: profileArg.status,
    );
    _profiles.add(profile);
    return profile;
  }
  
  Profile getProfile(Profile profileArg) {
    Profile profile = _profiles
      .firstWhere((profile) => profile.profileId == profileArg.profileId);
    return profile;
  }

  Profile updateProfile(Profile profileArg) {
    Profile profile = _profiles
      .firstWhere((profile) => profile.profileId == profileArg.profileId);
    profile.username = profileArg.username;
    return profile;
  }
  Profile removeProfile(Profile profileArg) {
    return _profiles
        .firstWhere((profile) => profile.profileId == profileArg.profileId)
      ..status = Profile_Status.DELETED;
  }
}