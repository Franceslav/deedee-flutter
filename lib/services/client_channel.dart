import 'package:deedee/injection.dart';
import 'package:deedee/services/shared.dart';
import 'package:grpc/grpc.dart';

class ProtobufClientChannel {
  Future<ClientChannel> createChannel() async {
    String? url = await locator.get<SharedUtils>().getPrefsIpAddress();
    String? port = await locator.get<SharedUtils>().getPrefsPort();
    return ClientChannel(
      url!,
      port: int.parse(port!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }
}
