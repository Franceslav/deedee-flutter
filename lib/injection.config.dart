// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:deedee/generated/AccountService.pbgrpc.dart' as _i3;
import 'package:deedee/generated/LocationService.pbgrpc.dart' as _i7;
import 'package:deedee/generated/TagService.pbgrpc.dart' as _i9;
import 'package:deedee/services/channel_service.dart' as _i6;
import 'package:deedee/services/fake/mock_account_service_client.dart' as _i4;
import 'package:deedee/services/fake/mock_location_service_client.dart' as _i8;
import 'package:deedee/services/fake/mock_tag_service_client.dart' as _i10;
import 'package:deedee/services/grpc.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _dev = 'dev';
const String _prod = 'prod';

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
  gh.lazySingleton<_i5.GRCPUtils>(
    () => _i5.GRCPUtils(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i6.GrpcServiceClient>(() => _i6.GrpcServiceClient());
  gh.lazySingleton<_i7.LocationServiceClient>(
    () => _i8.MockLocationServiceClient(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i9.TagServiceClient>(
    () => _i10.MockTagServiceClient(),
    registerFor: {_dev},
  );
  return getIt;
}