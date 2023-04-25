import 'package:deedee/generated/deedee/api/model/token.pb.dart';
import 'package:deedee/generated/deedee/api/service/token_service.pbgrpc.dart';
import 'package:injectable/injectable.dart';

import '../injection.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class TokenRepository {
  final _tagServiceClient = locator.get<TokenServiceClient>();

  Future<PushNotificationToken> getToken(String userId) async {
    var response = await _tagServiceClient.getToken(
      TokenRequest(userId: userId),
    );
    return response.token;
  }
}
