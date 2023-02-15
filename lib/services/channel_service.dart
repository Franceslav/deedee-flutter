import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class GrpcServiceClient {

  late ClientChannel clientChannel;

  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @factoryMethod
  Future<GrpcServiceClient> createChannelClient(@factoryParam String? url, @factoryParam String? port) async {
    clientChannel = ClientChannel(
      url!,
      port: int.parse(port!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    return this;
  }
}


