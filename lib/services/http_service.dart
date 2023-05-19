import 'dart:convert';

import 'package:deedee/constants.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:uni_links/uni_links.dart';

@LazySingleton(env: [Environment.dev, Environment.prod])
class HttpService {
  onUploadImage(selectedImage) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          "https://a44ae70e-0768-4737-9545-7b3aca98ebf8.mock.pstmn.io/post"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'image',
        selectedImage.readAsBytes().asStream(),
        selectedImage.lengthSync(),
        filename: selectedImage.path.split('/').last,
      ),
    );
    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    http.Response response = await http.Response.fromStream(res);
    print(response.statusCode);
  }

  Future<bool> sendPushNotificationRequest(
    String title,
    String message,
    String token,
    String tagId,
  ) async {
    const postUrl = DEFAULT_PUSH_NOTIFICATION_URL;

    final data = {
      "notification": {"body": message, "title": title},
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": tagId,
        "status": "done"
      },
      "to": token
    };

    final headers = {
      'content-type': DEFAULT_CONTENT_TYPE,
      'Authorization': 'key=$SERVER_KEY'
    };

    try {
      final response = await http.post(Uri.parse(postUrl),
          body: json.encode(data),
          encoding: Encoding.getByName(DEFAULT_ENCODING),
          headers: headers);

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Request sending failed with status code ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  String prepareRequestString(String requestId) {
    final url =
        Uri.https('deedee.com', '/my-request', {'requestId': requestId});
    return url.toString();
  }

  Future<String?> initDeepLinkListener() async {
    String? id;
    try {
      String? initialLink = await getInitialLink();
      if (initialLink != null) {
        id = _handleDeepLink(initialLink);
      } else {
        return null;
      }
    } on Exception catch (e) {
      print('Error: $e');
    }

    linkStream.listen((String? link) {
      id = _handleDeepLink(link!);
    });
    return id;
  }

  String? _handleDeepLink(String link) {
    final uri = Uri.parse(link);
    final requestId = uri.queryParameters['requestId'];

    if (requestId?.isNotEmpty ?? false) {
      return requestId;
    } else {
      return null;
      // TODO: Handle unknown request IDs or invalid deep links
    }
  }
}
