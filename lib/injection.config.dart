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
import 'generated/deedee/api/service/location_service.pbgrpc.dart' as _i23;
import 'generated/deedee/api/service/observation_service.pbgrpc.dart' as _i27;
import 'generated/deedee/api/service/payment_service.pbgrpc.dart' as _i31;
import 'generated/deedee/api/service/referral_service.pbgrpc.dart' as _i36;
import 'generated/deedee/api/service/service_request_service.pbgrpc.dart'
    as _i40;
import 'generated/deedee/api/service/supplier_service.pbgrpc.dart' as _i45;
import 'generated/deedee/api/service/tag_service.pbgrpc.dart' as _i49;
import 'generated/deedee/api/service/token_service.pbgrpc.dart' as _i53;
import 'generated/deedee/api/service/topic_service.pbgrpc.dart' as _i57;
import 'generated/deedee/api/service/verification_service.pbgrpc.dart' as _i61;
import 'repository/account_repository.dart' as _i3;
import 'repository/card_repository.dart' as _i7;
import 'repository/composite_filter_repository.dart' as _i8;
import 'repository/contact_repository.dart' as _i12;
import 'repository/gps_repository.dart' as _i17;
import 'repository/location_repository.dart' as _i21;
import 'repository/observation_repository.dart' as _i25;
import 'repository/payment_method_repository.dart' as _i29;
import 'repository/referral_repository.dart' as _i34;
import 'repository/service_request_repository.dart' as _i38;
import 'repository/supplier_repository.dart' as _i43;
import 'repository/tag_repository.dart' as _i47;
import 'repository/token_repository.dart' as _i51;
import 'repository/topic_repository.dart' as _i55;
import 'repository/verification_repository.dart' as _i59;
import 'services/channel_service.dart' as _i19;
import 'services/fake/api/account_service_api.dart' as _i4;
import 'services/fake/api/composite_filter_service_api.dart' as _i9;
import 'services/fake/api/contact_service_api.dart' as _i13;
import 'services/fake/api/gps_repository.dart' as _i16;
import 'services/fake/api/location_service_api.dart' as _i22;
import 'services/fake/api/observation_service_api.dart' as _i26;
import 'services/fake/api/payment_method_service_api.dart' as _i30;
import 'services/fake/api/referral_service_api.dart' as _i35;
import 'services/fake/api/service_request_service_api.dart' as _i39;
import 'services/fake/api/supplier_service_api.dart' as _i44;
import 'services/fake/api/tag_service_api.dart' as _i48;
import 'services/fake/api/token_service_api.dart' as _i52;
import 'services/fake/api/topic_repository.dart' as _i56;
import 'services/fake/api/verification_service_api.dart' as _i60;
import 'services/fake/mock_account_service_client.dart' as _i6;
import 'services/fake/mock_contact_service_client.dart' as _i15;
import 'services/fake/mock_filter_service_client.dart' as _i11;
import 'services/fake/mock_location_service_client.dart' as _i24;
import 'services/fake/mock_observation_service_client.dart' as _i28;
import 'services/fake/mock_payment_method_service_client.dart' as _i32;
import 'services/fake/mock_referral_service_client.dart' as _i37;
import 'services/fake/mock_service_request_service_client.dart' as _i41;
import 'services/fake/mock_supplier_service_client.dart' as _i46;
import 'services/fake/mock_tag_service_client.dart' as _i50;
import 'services/fake/mock_token_service_client.dart' as _i54;
import 'services/fake/mock_topic_service_client.dart' as _i58;
import 'services/fake/mock_verification_service_clent.dart' as _i62;
import 'services/grpc.dart' as _i18;
import 'services/http_service.dart' as _i20;
import 'services/push_notification_service.dart' as _i33;
import 'services/shared.dart' as _i42;

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
  gh.lazySingleton<_i21.LocationRepository>(
    () => _i21.LocationRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i22.LocationServiceApi>(
    () {
      final i = _i22.LocationServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i23.LocationServiceClient>(
    () => _i24.MockLocationServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i25.ObservationRepository>(
    () => _i25.ObservationRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i26.ObservationServiceApi>(
    () {
      final i = _i26.ObservationServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i27.ObservationServiceClient>(
    () => _i28.MockObservationServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i29.PaymentMethodRequestRepository>(
    () => _i29.PaymentMethodRequestRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i30.PaymentMethodServiceApi>(
    () {
      final i = _i30.PaymentMethodServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i31.PaymentServiceClient>(
    () => _i32.MockPaymentMethodServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i33.PushNotificationService>(
    () => _i33.PushNotificationService(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i34.ReferralRepository>(
    () => _i34.ReferralRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i35.ReferralServiceApi>(
    () => _i35.ReferralServiceApi(),
    registerFor: {
      _dev,
      _test,
    },
  );
  gh.lazySingleton<_i36.ReferralServiceClient>(
    () => _i37.MockReferralServiceClient(),
    registerFor: {
      _dev,
      _test,
    },
  );
  gh.lazySingleton<_i38.ServiceRequestRepository>(
    () => _i38.ServiceRequestRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i39.ServiceRequestServiceApi>(
    () {
      final i = _i39.ServiceRequestServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i40.ServiceRequestServiceClient>(
    () => _i41.MockServiceRequestServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i42.SharedUtils>(
    () => _i42.SharedUtils(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i43.SupplierRepository>(
    () => _i43.SupplierRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i44.SupplierServiceApi>(
    () {
      final i = _i44.SupplierServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i45.SupplierServiceClient>(
    () => _i46.MockSupplierServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i47.TagRepository>(
    () => _i47.TagRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i48.TagServiceApi>(
    () {
      final i = _i48.TagServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i49.TagServiceClient>(
    () => _i50.MockTagServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i51.TokenRepository>(
    () => _i51.TokenRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i52.TokenServiceApi>(
    () {
      final i = _i52.TokenServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _prod,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i53.TokenServiceClient>(
    () => _i54.MockTokenServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i55.TopicRepository>(
    () => _i55.TopicRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i56.TopicServiceApi>(
    () {
      final i = _i56.TopicServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _prod,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i57.TopicServiceClient>(
    () => _i58.MockTopicServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i59.VerificationRepository>(
    () => _i59.VerificationRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i60.VerificationServiceApi>(
    () {
      final i = _i60.VerificationServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i61.VerificationServiceClient>(
    () => _i62.MockVerificationServiceClient(),
    registerFor: {_dev},
  );
  return getIt;
}
