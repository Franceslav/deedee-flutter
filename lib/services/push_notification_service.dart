import 'dart:convert';
import 'package:deedee/constants.dart';
import 'package:deedee/ui/messages/message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:overlay_support/overlay_support.dart';

class PushNotificationService {
  PushNotificationService._();

  static final PushNotificationService _instance = PushNotificationService._();

  static PushNotificationService get instance => _instance;

  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  late String? deviceToken;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('authorized');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('provisional');
    } else {
      print('unhandled');
    }
  }

  Future<String> getToken() async {
    try {
      final token = await messaging.getToken();
      if (token != null) {
        return token;
      } else {
        print('Token is null');
        return '';
      }
    } catch (e) {
      print(e.toString());
      return '';
    }
  }


   Future<void> initInfo() async {

    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/launcher_icon');
    var initializationSettings =
        InitializationSettings(android: androidInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );

      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails('123', '123',
              importance: Importance.high,
              styleInformation: bigTextStyleInformation,
              priority: Priority.high,
              playSound: true,
          );

      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, platformChannelSpecifics,
          payload: message.data['body']);

      showOverlayNotification((context) {
        return MessageNotification(
          message: message,
          onReply: () {
            OverlaySupportEntry.of(context)!.dismiss();
            toast('message checked');
          },
        );
      }, duration: const Duration(milliseconds: 5000));
    });
  }


  Future<bool> makeCall() async {
    await initInfo();

    const postUrl = 'https://fcm.googleapis.com/fcm/send';
    String token = await getToken();

    final data = {
      "notification": {"body": "Text Text Text Text Text", "title": "Title"},
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done"
      },
      "to": token
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization':
          'key=$SERVER_KEY'
    };

    try {
      final response = await http.post(Uri.parse(postUrl),
          body: json.encode(data),
          encoding: Encoding.getByName('utf-8'),
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

}
