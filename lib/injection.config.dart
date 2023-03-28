// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:deedee/generated/AccountService.pbgrpc.dart' as _i3;
import 'package:deedee/generated/LocationService.pbgrpc.dart' as _i12;
import 'package:deedee/generated/TagService.pbgrpc.dart' as _i17;
import 'package:deedee/generated/VerificationService.pbgrpc.dart' as _i20;
import 'package:deedee/generated/filter_service.pbgrpc.dart' as _i6;
import 'package:deedee/repository/filter_repository.dart' as _i5;
import 'package:deedee/repository/gps_repository.dart' as _i8;
import 'package:deedee/repository/tag_repository.dart' as _i16;
import 'package:deedee/repository/topic_repository.dart' as _i19;
import 'package:deedee/services/channel_service.dart' as _i10;
import 'package:deedee/services/fake/mock_account_service_client.dart' as _i4;
import 'package:deedee/services/fake/mock_filter_service_client.dart' as _i7;
import 'package:deedee/services/fake/mock_location_service_client.dart' as _i13;
import 'package:deedee/services/fake/mock_tag_service_client.dart' as _i18;
import 'package:deedee/services/fake/mock_verification_service_clent.dart'
    as _i21;
import 'package:deedee/services/grpc.dart' as _i9;
import 'package:deedee/services/http_service.dart' as _i11;
import 'package:deedee/services/push_notification_service.dart' as _i14;
import 'package:deedee/services/shared.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _dev = 'dev';
const String _prod = 'prod';
const String _test = 'test';

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $configureDependencies(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AccountServiceClient>(
    () => _i4.MockAccountServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i5.FilterRepository>(
    () => _i5.FilterRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i6.FilterServiceClient>(
    () => _i7.MockFilterServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i8.GPSRepository>(
    () => _i8.GPSRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i9.GRCPRepository>(
    () => _i9.GRCPRepository(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i10.GrpcServiceClient>(() => _i10.GrpcServiceClient());
  gh.lazySingleton<_i11.HttpService>(
    () => _i11.HttpService(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i12.LocationServiceClient>(
    () => _i13.MockLocationServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i14.PushNotificationService>(
    () => _i14.PushNotificationService(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i15.SharedUtils>(
    () => _i15.SharedUtils(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i16.TagRepository>(
    () => _i16.TagRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i17.TagServiceClient>(
    () => _i18.MockTagServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i19.TopicRepository>(
    () => _i19.TopicRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i20.VerificationServiceClient>(
    () => _i21.MockVerificationServiceClient(),
    registerFor: {_dev},
  );
  return getIt;
}
