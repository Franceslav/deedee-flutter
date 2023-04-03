// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'generated/AccountService.pbgrpc.dart' as _i3;
import 'generated/filter_service.pbgrpc.dart' as _i7;
import 'generated/LocationService.pbgrpc.dart' as _i14;
import 'generated/request_service_service.pbgrpc.dart' as _i19;
import 'generated/TagService.pbgrpc.dart' as _i24;
import 'generated/VerificationService.pbgrpc.dart' as _i28;
import 'repository/filter_repository.dart' as _i5;
import 'repository/gps_repository.dart' as _i9;
import 'repository/service_request_repository.dart' as _i17;
import 'repository/tag_repository.dart' as _i22;
import 'repository/topic_repository.dart' as _i26;
import 'services/channel_service.dart' as _i12;
import 'services/fake/api/filter_repository.dart' as _i6;
import 'services/fake/api/gps_repository.dart' as _i10;
import 'services/fake/api/service_request_repository.dart' as _i18;
import 'services/fake/api/tag_repository.dart' as _i23;
import 'services/fake/api/topic_repository.dart' as _i27;
import 'services/fake/mock_account_service_client.dart' as _i4;
import 'services/fake/mock_filter_service_client.dart' as _i8;
import 'services/fake/mock_location_service_client.dart' as _i15;
import 'services/fake/mock_service_request_service_client.dart' as _i20;
import 'services/fake/mock_tag_service_client.dart' as _i25;
import 'services/fake/mock_verification_service_clent.dart' as _i29;
import 'services/grpc.dart' as _i11;
import 'services/http_service.dart' as _i13;
import 'services/push_notification_service.dart' as _i16;
import 'services/shared.dart' as _i21;

const String _dev = 'dev';
const String _prod = 'prod';
const String _test = 'test';

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $configureDependencies(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
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
  await gh.lazySingletonAsync<_i6.FilterServiceApi>(
    () {
      final i = _i6.FilterServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i7.FilterServiceClient>(
    () => _i8.MockFilterServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i9.GPSRepository>(
    () => _i9.GPSRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i10.GPSRepository>(
    () => _i10.GPSRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i11.GRCPRepository>(
    () => _i11.GRCPRepository(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i12.GrpcServiceClient>(() => _i12.GrpcServiceClient());
  gh.lazySingleton<_i13.HttpService>(
    () => _i13.HttpService(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i14.LocationServiceClient>(
    () => _i15.MockLocationServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i16.PushNotificationService>(
    () => _i16.PushNotificationService(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i17.ServiceRequestRepository>(
    () => _i17.ServiceRequestRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i18.ServiceRequestServiceApi>(
    () {
      final i = _i18.ServiceRequestServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i19.ServiceRequestServiceClient>(
    () => _i20.MockServiceRequestServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i21.SharedUtils>(
    () => _i21.SharedUtils(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i22.TagRepository>(
    () => _i22.TagRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i23.TagRepository>(
    () => _i23.TagRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i24.TagServiceClient>(
    () => _i25.MockTagServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i26.TopicRepository>(
    () => _i26.TopicRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i27.TopicRepository>(
    () => _i27.TopicRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i28.VerificationServiceClient>(
    () => _i29.MockVerificationServiceClient(),
    registerFor: {_dev},
  );
  return getIt;
}
