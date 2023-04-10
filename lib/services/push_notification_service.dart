import 'package:auto_route/auto_route.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/http_service.dart';
import 'package:deedee/ui/messages/message.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:overlay_support/overlay_support.dart';

@LazySingleton(env: [Environment.dev, Environment.prod])
class PushNotificationService {
  final HttpService httpService = locator.get<HttpService>();
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

  Future<void> initInfo(BuildContext context) async {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/launcher_icon');
    var initializationSettings =
        InitializationSettings(android: androidInitialize);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        context.router.push(RequestScreenRoute());
      },
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );

      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        '123',
        '123',
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

  Future<bool> sendPushNotification([BuildContext? context]) async {
    await initInfo(context!);
    return httpService.sendPushNotificationRequest("New Order Request",
        "This is a test order. Please accept", await getToken());
  }
}
