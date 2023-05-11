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

import 'generated/deedee/api/service/account_service.pbgrpc.dart' as _i5;
import 'generated/deedee/api/service/composite_filter_service.pbgrpc.dart'
    as _i10;
import 'generated/deedee/api/service/contact_service.pbgrpc.dart' as _i14;
import 'generated/deedee/api/service/observation_service.pbgrpc.dart' as _i25;
import 'generated/deedee/api/service/payment_service.pbgrpc.dart' as _i28;
import 'generated/deedee/api/service/referral_service.pbgrpc.dart' as _i33;
import 'generated/deedee/api/service/service_request_service.pbgrpc.dart'
    as _i38;
import 'generated/deedee/api/service/supplier_service.pbgrpc.dart' as _i43;
import 'generated/deedee/api/service/tag_service.pbgrpc.dart' as _i47;
import 'generated/deedee/api/service/token_service.pbgrpc.dart' as _i51;
import 'generated/deedee/api/service/topic_service.pbgrpc.dart' as _i55;
import 'generated/deedee/api/service/verification_service.pbgrpc.dart' as _i59;
import 'generated/LocationService.pbgrpc.dart' as _i21;
import 'repository/account_repository.dart' as _i3;
import 'repository/card_repository.dart' as _i7;
import 'repository/composite_filter_repository.dart' as _i8;
import 'repository/contact_repository.dart' as _i12;
import 'repository/gps_repository.dart' as _i16;
import 'repository/observation_repository.dart' as _i23;
import 'repository/payment_method_repository.dart' as _i35;
import 'repository/referral_repository.dart' as _i31;
import 'repository/service_request_repository.dart' as _i36;
import 'repository/supplier_repository.dart' as _i41;
import 'repository/tag_repository.dart' as _i45;
import 'repository/token_repository.dart' as _i49;
import 'repository/topic_repository.dart' as _i53;
import 'repository/verification_repository.dart' as _i57;
import 'services/channel_service.dart' as _i19;
import 'services/fake/api/account_service_api.dart' as _i4;
import 'services/fake/api/composite_filter_service_api.dart' as _i9;
import 'services/fake/api/contact_service_api.dart' as _i13;
import 'services/fake/api/gps_repository.dart' as _i17;
import 'services/fake/api/observation_service_api.dart' as _i24;
import 'services/fake/api/payment_method_service_api.dart' as _i27;
import 'services/fake/api/referral_service_api.dart' as _i32;
import 'services/fake/api/service_request_service_api.dart' as _i37;
import 'services/fake/api/supplier_service_api.dart' as _i42;
import 'services/fake/api/tag_service_api.dart' as _i46;
import 'services/fake/api/token_service_api.dart' as _i50;
import 'services/fake/api/topic_repository.dart' as _i54;
import 'services/fake/api/verification_service_api.dart' as _i58;
import 'services/fake/mock_account_service_client.dart' as _i6;
import 'services/fake/mock_contact_service_client.dart' as _i15;
import 'services/fake/mock_filter_service_client.dart' as _i11;
import 'services/fake/mock_location_service_client.dart' as _i22;
import 'services/fake/mock_observation_service_client.dart' as _i26;
import 'services/fake/mock_payment_method_service_client.dart' as _i29;
import 'services/fake/mock_referral_service_client.dart' as _i34;
import 'services/fake/mock_service_request_service_client.dart' as _i39;
import 'services/fake/mock_supplier_service_client.dart' as _i44;
import 'services/fake/mock_tag_service_client.dart' as _i48;
import 'services/fake/mock_token_service_client.dart' as _i52;
import 'services/fake/mock_topic_service_client.dart' as _i56;
import 'services/fake/mock_verification_service_clent.dart' as _i60;
import 'services/grpc.dart' as _i18;
import 'services/http_service.dart' as _i20;
import 'services/push_notification_service.dart' as _i30;
import 'services/shared.dart' as _i40;

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
  gh.lazySingleton<_i23.ObservationRepository>(
    () => _i23.ObservationRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i24.ObservationServiceApi>(
    () {
      final i = _i24.ObservationServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i25.ObservationServiceClient>(
    () => _i26.MockObservationServiceClient(),
    registerFor: {_dev},
  );
  await gh.lazySingletonAsync<_i27.PaymentMethodServiceApi>(
    () {
      final i = _i27.PaymentMethodServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i28.PaymentServiceClient>(
    () => _i29.MockPaymentMethodServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i30.PushNotificationService>(
    () => _i30.PushNotificationService(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i31.ReferralRepository>(
    () => _i31.ReferralRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i32.ReferralServiceApi>(
    () => _i32.ReferralServiceApi(),
    registerFor: {
      _dev,
      _test,
    },
  );
  gh.lazySingleton<_i33.ReferralServiceClient>(
    () => _i34.MockReferralServiceClient(),
    registerFor: {
      _dev,
      _test,
    },
  );
  gh.lazySingleton<_i35.ServiceRequestRepository>(
    () => _i35.ServiceRequestRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i36.ServiceRequestRepository>(
    () => _i36.ServiceRequestRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i37.ServiceRequestServiceApi>(
    () {
      final i = _i37.ServiceRequestServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i38.ServiceRequestServiceClient>(
    () => _i39.MockServiceRequestServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i40.SharedUtils>(
    () => _i40.SharedUtils(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i41.SupplierRepository>(
    () => _i41.SupplierRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i42.SupplierServiceApi>(
    () {
      final i = _i42.SupplierServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i43.SupplierServiceClient>(
    () => _i44.MockSupplierServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i45.TagRepository>(
    () => _i45.TagRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i46.TagServiceApi>(
    () {
      final i = _i46.TagServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i47.TagServiceClient>(
    () => _i48.MockTagServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i49.TokenRepository>(
    () => _i49.TokenRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i50.TokenServiceApi>(
    () {
      final i = _i50.TokenServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _prod,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i51.TokenServiceClient>(
    () => _i52.MockTokenServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i53.TopicRepository>(
    () => _i53.TopicRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i54.TopicServiceApi>(
    () {
      final i = _i54.TopicServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _prod,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i55.TopicServiceClient>(
    () => _i56.MockTopicServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i57.VerificationRepository>(
    () => _i57.VerificationRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i58.VerificationServiceApi>(
    () {
      final i = _i58.VerificationServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i59.VerificationServiceClient>(
    () => _i60.MockVerificationServiceClient(),
    registerFor: {_dev},
  );
  return getIt;
}
