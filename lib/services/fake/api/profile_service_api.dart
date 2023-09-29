// import 'package:deedee/generated/deedee/api/model/geolocation.pb.dart';
import 'package:deedee/generated/deedee/api/model/profile.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class ProfileServiceApi {
  late List<Profile> _profiles;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _profiles = [
      Profile(
        profileId: Int64(0),
        referredBy: '',
        userId: 'mister@mail.ru',
        username: 'Igor',
        contacts: [],
        status: Profile_Status.ACTIVE,
      )
    ];
  }

  Profile createProfile(Profile profileArg) {
    Profile profile = Profile(
      profileId: profileArg.profileId,
      userId: profileArg.userId,
      referredBy: profileArg.referredBy,
      username: profileArg.username,
      contacts: profileArg.contacts,
      status: profileArg.status,
    );
    _profiles.add(profile);
    return profile;
  }

  Profile getProfile(Profile profileArg) {
    Profile profile =
        _profiles.firstWhere((profile) => profile.userId == profileArg.userId);
    return profile;
  }

  Profile editProfile(Profile profileArg) {
    Profile profile =
        _profiles.firstWhere((profile) => profile.userId == profileArg.userId);
    profile.username = profileArg.username;
    return profile;
  }

  Profile removeProfile(Profile profileArg) {
    return _profiles
        .firstWhere((profile) => profile.userId == profileArg.userId)
      ..status = Profile_Status.DELETED;
  }
}
