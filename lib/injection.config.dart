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

import 'generated/AccountService.pbgrpc.dart' as _i5;
import 'generated/deedee/api/service/composite_filter_service.pbgrpc.dart'
    as _i10;
import 'generated/deedee/api/service/contact_service.pbgrpc.dart' as _i14;
import 'generated/deedee/api/service/service_request_service.pbgrpc.dart'
import 'generated/deedee/api/service/tag_service.pbgrpc.dart' as _i31;
import 'generated/deedee/api/service/token_service.pbgrpc.dart' as _i35;
import 'generated/deedee/api/service/topic_service.pbgrpc.dart' as _i39;
import 'generated/LocationService.pbgrpc.dart' as _i21;
import 'generated/VerificationService.pbgrpc.dart' as _i41;
import 'repository/account_repository.dart' as _i3;
import 'repository/card_repository.dart' as _i7;
import 'repository/composite_filter_repository.dart' as _i8;
import 'repository/contact_repository.dart' as _i12;
import 'repository/gps_repository.dart' as _i17;
import 'repository/service_request_repository.dart' as _i24;
import 'repository/tag_repository.dart' as _i29;
import 'repository/token_repository.dart' as _i33;
import 'repository/topic_repository.dart' as _i37;
import 'services/channel_service.dart' as _i19;
import 'services/fake/api/account_service_api.dart' as _i4;
import 'services/fake/api/composite_filter_service_api.dart' as _i9;
import 'services/fake/api/contact_service_api.dart' as _i13;
import 'services/fake/api/gps_repository.dart' as _i16;
import 'services/fake/api/service_request_service_api.dart' as _i25;
import 'services/fake/api/tag_service_api.dart' as _i30;
import 'services/fake/api/token_service_api.dart' as _i34;
import 'services/fake/api/topic_repository.dart' as _i38;
import 'services/fake/mock_account_service_client.dart' as _i6;
import 'services/fake/mock_contact_service_client.dart' as _i15;
import 'services/fake/mock_filter_service_client.dart' as _i11;
import 'services/fake/mock_location_service_client.dart' as _i22;
import 'services/fake/mock_service_request_service_client.dart' as _i27;
import 'services/fake/mock_tag_service_client.dart' as _i32;
import 'services/fake/mock_token_service_client.dart' as _i36;
import 'services/fake/mock_topic_service_client.dart' as _i40;
import 'services/fake/mock_verification_service_clent.dart' as _i42;
import 'services/grpc.dart' as _i18;
import 'services/http_service.dart' as _i20;
import 'services/push_notification_service.dart' as _i23;
import 'services/shared.dart' as _i28;

    as _i24;
import 'generated/deedee/api/service/tag_service.pbgrpc.dart' as _i29;
import 'generated/deedee/api/service/token_service.pbgrpc.dart' as _i33;
import 'generated/deedee/api/service/topic_service.pbgrpc.dart' as _i37;
import 'generated/LocationService.pbgrpc.dart' as _i19;
import 'generated/VerificationService.pbgrpc.dart' as _i39;
import 'repository/card_repository.dart' as _i5;
import 'repository/composite_filter_repository.dart' as _i6;
import 'repository/contact_repository.dart' as _i10;
import 'repository/gps_repository.dart' as _i15;
import 'repository/service_request_repository.dart' as _i22;
import 'repository/tag_repository.dart' as _i27;
import 'repository/token_repository.dart' as _i31;
import 'repository/topic_repository.dart' as _i35;
import 'services/channel_service.dart' as _i17;
import 'services/fake/api/composite_filter_service_api.dart' as _i7;
import 'services/fake/api/contact_service_api.dart' as _i11;
import 'services/fake/api/gps_repository.dart' as _i14;
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
  gh.lazySingleton<_i3.AccountRepository>(
    () => _i3.AccountRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i4.AccountServiceApi>(
    () {
      final i = _i4.AccountServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _prod,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i5.AccountServiceClient>(
    () => _i6.MockAccountServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i7.CardRepository>(
    () => _i7.CardRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i8.CompositeFilterRepository>(
    () => _i8.CompositeFilterRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i9.CompositeFilterServiceApi>(
    () {
      final i = _i9.CompositeFilterServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _prod,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i10.CompositeFilterServiceClient>(
    () => _i11.MockCompositeFilterServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i12.ContactRepository>(
    () => _i12.ContactRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i13.ContactServiceApi>(
    () {
      final i = _i13.ContactServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i14.ContactServiceClient>(
    () => _i15.MockContactServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i16.GPSRepository>(
    () => _i16.GPSRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i17.GPSRepository>(
    () => _i17.GPSRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i18.GRCPRepository>(
    () => _i18.GRCPRepository(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i19.GrpcServiceClient>(() => _i19.GrpcServiceClient());
  gh.lazySingleton<_i20.HttpService>(
    () => _i20.HttpService(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i21.LocationServiceClient>(
    () => _i22.MockLocationServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i23.PushNotificationService>(
    () => _i23.PushNotificationService(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i24.ServiceRequestRepository>(
    () => _i24.ServiceRequestRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i25.ServiceRequestServiceApi>(
    () {
      final i = _i25.ServiceRequestServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i26.ServiceRequestServiceClient>(
    () => _i27.MockServiceRequestServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i28.SharedUtils>(
    () => _i28.SharedUtils(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i29.TagRepository>(
    () => _i29.TagRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i30.TagServiceApi>(
    () {
      final i = _i30.TagServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i31.TagServiceClient>(
    () => _i32.MockTagServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i33.TokenRepository>(
    () => _i33.TokenRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i34.TokenServiceApi>(
    () {
      final i = _i34.TokenServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _prod,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i35.TokenServiceClient>(
    () => _i36.MockTokenServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i37.TopicRepository>(
    () => _i37.TopicRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i38.TopicServiceApi>(
    () {
      final i = _i38.TopicServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _prod,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i39.TopicServiceClient>(
    () => _i40.MockTopicServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i41.VerificationServiceClient>(
    () => _i42.MockVerificationServiceClient(),
    registerFor: {_dev},
  );
  return getIt;
}
