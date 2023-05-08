// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:deedee/generated/deedee/api/service/account_service.pbgrpc.dart'
    as _i5;
import 'package:deedee/generated/deedee/api/service/composite_filter_service.pbgrpc.dart'
    as _i10;
import 'package:deedee/generated/deedee/api/service/contact_service.pbgrpc.dart'
    as _i14;
import 'package:deedee/generated/deedee/api/service/payment_service.pbgrpc.dart'
    as _i25;
import 'package:deedee/generated/deedee/api/service/referral_service.pbgrpc.dart'
    as _i30;
import 'package:deedee/generated/deedee/api/service/service_request_service.pbgrpc.dart'
    as _i34;
import 'package:deedee/generated/deedee/api/service/supplier_service.pbgrpc.dart'
    as _i39;
import 'package:deedee/generated/deedee/api/service/tag_service.pbgrpc.dart'
    as _i43;
import 'package:deedee/generated/deedee/api/service/token_service.pbgrpc.dart'
    as _i47;
import 'package:deedee/generated/deedee/api/service/topic_service.pbgrpc.dart'
    as _i51;
import 'package:deedee/generated/deedee/api/service/verification_service.pbgrpc.dart'
    as _i55;
import 'package:deedee/generated/LocationService.pbgrpc.dart' as _i21;
import 'package:deedee/repository/account_repository.dart' as _i3;
import 'package:deedee/repository/card_repository.dart' as _i7;
import 'package:deedee/repository/composite_filter_repository.dart' as _i8;
import 'package:deedee/repository/contact_repository.dart' as _i12;
import 'package:deedee/repository/gps_repository.dart' as _i16;
import 'package:deedee/repository/payment_method_repository.dart' as _i23;
import 'package:deedee/repository/referral_repository.dart' as _i28;
import 'package:deedee/repository/service_request_repository.dart' as _i32;
import 'package:deedee/repository/supplier_repository.dart' as _i37;
import 'package:deedee/repository/tag_repository.dart' as _i41;
import 'package:deedee/repository/token_repository.dart' as _i45;
import 'package:deedee/repository/topic_repository.dart' as _i49;
import 'package:deedee/repository/verification_repository.dart' as _i53;
import 'package:deedee/services/channel_service.dart' as _i19;
import 'package:deedee/services/fake/api/account_service_api.dart' as _i4;
import 'package:deedee/services/fake/api/composite_filter_service_api.dart'
    as _i9;
import 'package:deedee/services/fake/api/contact_service_api.dart' as _i13;
import 'package:deedee/services/fake/api/gps_repository.dart' as _i17;
import 'package:deedee/services/fake/api/payment_method_service_api.dart'
    as _i24;
import 'package:deedee/services/fake/api/referral_service_api.dart' as _i29;
import 'package:deedee/services/fake/api/service_request_service_api.dart'
    as _i33;
import 'package:deedee/services/fake/api/supplier_service_api.dart' as _i38;
import 'package:deedee/services/fake/api/tag_service_api.dart' as _i42;
import 'package:deedee/services/fake/api/token_service_api.dart' as _i46;
import 'package:deedee/services/fake/api/topic_repository.dart' as _i50;
import 'package:deedee/services/fake/api/verification_service_api.dart' as _i54;
import 'package:deedee/services/fake/mock_account_service_client.dart' as _i6;
import 'package:deedee/services/fake/mock_contact_service_client.dart' as _i15;
import 'package:deedee/services/fake/mock_filter_service_client.dart' as _i11;
import 'package:deedee/services/fake/mock_location_service_client.dart' as _i22;
import 'package:deedee/services/fake/mock_payment_method_service_client.dart'
    as _i26;
import 'package:deedee/services/fake/mock_referral_service_client.dart' as _i31;
import 'package:deedee/services/fake/mock_service_request_service_client.dart'
    as _i35;
import 'package:deedee/services/fake/mock_supplier_service_client.dart' as _i40;
import 'package:deedee/services/fake/mock_tag_service_client.dart' as _i44;
import 'package:deedee/services/fake/mock_token_service_client.dart' as _i48;
import 'package:deedee/services/fake/mock_topic_service_client.dart' as _i52;
import 'package:deedee/services/fake/mock_verification_service_clent.dart'
    as _i56;
import 'package:deedee/services/grpc.dart' as _i18;
import 'package:deedee/services/http_service.dart' as _i20;
import 'package:deedee/services/push_notification_service.dart' as _i27;
import 'package:deedee/services/shared.dart' as _i36;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
  gh.lazySingleton<_i23.PaymentMethodRequestRepository>(
    () => _i23.PaymentMethodRequestRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i24.PaymentMethodServiceApi>(
    () {
      final i = _i24.PaymentMethodServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i25.PaymentServiceClient>(
    () => _i26.MockPaymentMethodServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i27.PushNotificationService>(
    () => _i27.PushNotificationService(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i28.ReferralRepository>(
    () => _i28.ReferralRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i29.ReferralServiceApi>(
    () => _i29.ReferralServiceApi(),
    registerFor: {
      _dev,
      _test,
    },
  );
  gh.lazySingleton<_i30.ReferralServiceClient>(
    () => _i31.MockReferralServiceClient(),
    registerFor: {
      _dev,
      _test,
    },
  );
  gh.lazySingleton<_i32.ServiceRequestRepository>(
    () => _i32.ServiceRequestRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i33.ServiceRequestServiceApi>(
    () {
      final i = _i33.ServiceRequestServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i34.ServiceRequestServiceClient>(
    () => _i35.MockServiceRequestServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i36.SharedUtils>(
    () => _i36.SharedUtils(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i37.SupplierRepository>(
    () => _i37.SupplierRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i38.SupplierServiceApi>(
    () {
      final i = _i38.SupplierServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i39.SupplierServiceClient>(
    () => _i40.MockSupplierServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i41.TagRepository>(
    () => _i41.TagRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i42.TagServiceApi>(
    () {
      final i = _i42.TagServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i43.TagServiceClient>(
    () => _i44.MockTagServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i45.TokenRepository>(
    () => _i45.TokenRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i46.TokenServiceApi>(
    () {
      final i = _i46.TokenServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _prod,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i47.TokenServiceClient>(
    () => _i48.MockTokenServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i49.TopicRepository>(
    () => _i49.TopicRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i50.TopicServiceApi>(
    () {
      final i = _i50.TopicServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _prod,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i51.TopicServiceClient>(
    () => _i52.MockTopicServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i53.VerificationRepository>(
    () => _i53.VerificationRepository(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  await gh.lazySingletonAsync<_i54.VerificationServiceApi>(
    () {
      final i = _i54.VerificationServiceApi();
      return i.init().then((_) => i);
    },
    registerFor: {
      _dev,
      _test,
    },
    preResolve: true,
  );
  gh.lazySingleton<_i55.VerificationServiceClient>(
    () => _i56.MockVerificationServiceClient(),
    registerFor: {_dev},
  );
  return getIt;
}
