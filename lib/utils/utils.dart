import 'package:share_plus/share_plus.dart';

import '../model/user.dart';

void shareFunction(User user) async{
  return await Share.share(Uri.https('deedee.com', user.userId).toString());
}