import 'package:deedee/services/grpc.dart';
import 'package:deedee/services/shared.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I; // GetIt.I is also valid
void setUpServiceLocator() {
  // serviceLocator.registerLazySingleton<GRCPUtils>(() => ConsoleLogger());
  serviceLocator.registerLazySingleton<GRCPUtils>(() => GRCPUtils());
  serviceLocator.registerLazySingleton<SharedUtils>(() => SharedUtils());
  // register more instances
}
