import 'package:deedee/generated/deedee/api/model/token.pb.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class TokenServiceApi {
  late Map<String, PushNotificationToken> _tokens;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _tokens = {
      '': PushNotificationToken()
        ..value =
            'cDgVV7YhSGamhrGAlaOLOa:APA91bG-DtLKd37D4yyuIl8l5KumT6el6Uv_lCldVjYKIG85SnSmEZD6evIcbPNraidGO3vS4N8O5slXYP_uAMBdhBde75JhZqU-vgfMCkMq5bJ5JH1_YqKRN-VBcFyJYiw7xLN8cRki',
    };
  }

  Future<PushNotificationToken> getToken(String userId) async {
    return _tokens[userId]!;
  }
}
