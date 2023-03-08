import 'package:url_launcher/url_launcher.dart';

class SocialService {
  static Future<void> launchInstagram(String instagramUser) async {
    final path = "https://www.instagram.com/$instagramUser";

    try {
      await launchUrl(Uri.parse(path), mode: LaunchMode.externalApplication);
    } catch (e) {
      throw 'Could not launch Instagram';
    }
  }
}
