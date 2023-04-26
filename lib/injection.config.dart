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
import 'generated/deedee/api/service/composite_filter_service.pbgrpc.dart'
    as _i8;
import 'generated/deedee/api/service/contact_service.pbgrpc.dart' as _i12;
import 'generated/deedee/api/service/service_request_service.pbgrpc.dart'
    as _i24;
import 'generated/deedee/api/service/tag_service.pbgrpc.dart' as _i29;
import 'generated/deedee/api/service/token_service.pbgrpc.dart' as _i33;
import 'generated/deedee/api/service/topic_service.pbgrpc.dart' as _i37;
import 'generated/LocationService.pbgrpc.dart' as _i19;
import 'generated/VerificationService.pbgrpc.dart' as _i39;
import 'repository/card_repository.dart' as _i5;
import 'repository/composite_filter_repository.dart' as _i6;
import 'repository/contact_repository.dart' as _i10;
import 'repository/gps_repository.dart' as _i14;
import 'repository/service_request_repository.dart' as _i22;
import 'repository/tag_repository.dart' as _i27;
import 'repository/token_repository.dart' as _i31;
import 'repository/topic_repository.dart' as _i35;
import 'services/channel_service.dart' as _i17;
import 'services/fake/api/composite_filter_service_api.dart' as _i7;
import 'services/fake/api/contact_service_api.dart' as _i11;
import 'services/fake/api/gps_repository.dart' as _i15;
import 'services/fake/api/service_request_service_api.dart' as _i23;
import 'services/fake/api/tag_service_api.dart' as _i28;
import 'services/fake/api/token_service_api.dart' as _i32;
import 'services/fake/api/topic_repository.dart' as _i36;
import 'services/fake/mock_account_service_client.dart' as _i4;
import 'services/fake/mock_contact_service_client.dart' as _i13;
import 'services/fake/mock_filter_service_client.dart' as _i9;
import 'services/fake/mock_location_service_client.dart' as _i20;
import 'services/fake/mock_service_request_service_client.dart' as _i25;
import 'services/fake/mock_tag_service_client.dart' as _i30;
import 'services/fake/mock_token_service_client.dart' as _i34;
import 'services/fake/mock_topic_service_client.dart' as _i38;
import 'services/fake/mock_verification_service_clent.dart' as _i40;
import 'services/grpc.dart' as _i16;
import 'services/http_service.dart' as _i18;
import 'services/push_notification_service.dart' as _i21;
import 'services/shared.dart' as _i26;

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
  gh.lazySingleton<_i5.CardRepository>(
    () => _i5.CardRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i6.CompositeFilterRepository>(
    () => _i6.CompositeFilterRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i7.CompositeFilterServiceApi>(
    () {
      final i = _i7.CompositeFilterServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _prod,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i8.CompositeFilterServiceClient>(
    () => _i9.MockCompositeFilterServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i10.ContactRepository>(
    () => _i10.ContactRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i11.ContactServiceApi>(
    () {
      final i = _i11.ContactServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i12.ContactServiceClient>(
    () => _i13.MockContactServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i14.GPSRepository>(
    () => _i14.GPSRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i15.GPSRepository>(
    () => _i15.GPSRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i16.GRCPRepository>(
    () => _i16.GRCPRepository(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i17.GrpcServiceClient>(() => _i17.GrpcServiceClient());
  gh.lazySingleton<_i18.HttpService>(
    () => _i18.HttpService(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i19.LocationServiceClient>(
    () => _i20.MockLocationServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i21.PushNotificationService>(
    () => _i21.PushNotificationService(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i22.ServiceRequestRepository>(
    () => _i22.ServiceRequestRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i23.ServiceRequestServiceApi>(
    () {
      final i = _i23.ServiceRequestServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i24.ServiceRequestServiceClient>(
    () => _i25.MockServiceRequestServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i26.SharedUtils>(
    () => _i26.SharedUtils(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i27.TagRepository>(
    () => _i27.TagRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i28.TagServiceApi>(
    () {
      final i = _i28.TagServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i29.TagServiceClient>(
    () => _i30.MockTagServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i31.TokenRepository>(
    () => _i31.TokenRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i32.TokenServiceApi>(
    () {
      final i = _i32.TokenServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _prod,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i33.TokenServiceClient>(
    () => _i34.MockTokenServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i35.TopicRepository>(
    () => _i35.TopicRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i36.TopicServiceApi>(
    () {
      final i = _i36.TopicServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _prod,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i37.TopicServiceClient>(
    () => _i38.MockTopicServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i39.VerificationServiceClient>(
    () => _i40.MockVerificationServiceClient(),
    registerFor: {_dev},
  );
  return getIt;
}
