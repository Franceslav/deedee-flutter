import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessageNotification extends StatelessWidget {
  final VoidCallback onReply;

  final RemoteMessage message;

  const MessageNotification({
    Key? key,
    required this.onReply,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: SafeArea(
        child: ListTile(
          leading: SizedBox.fromSize(
              size: const Size(40, 40),
              child: Image.asset('assets/images/deedee_logo.png')),
          title: Text(message.notification!.title.toString()),
          subtitle: Text(message.notification!.body.toString()),
          trailing: IconButton(
              icon: const Icon(Icons.reply),
              onPressed: () {
                onReply();
              }),
        ),
      ),
    );
  }

}
