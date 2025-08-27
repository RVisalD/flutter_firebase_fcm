import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaesMsg {
  final msgService = FirebaseMessaging.instance;

  initFCM() async {
    await msgService.requestPermission();

    var token = await msgService.getToken();

    print("FCM Token: $token");

    FirebaseMessaging.onBackgroundMessage(handleNotification);
    FirebaseMessaging.onMessage.listen(handleNotification);
  }
}

Future<void> handleNotification(RemoteMessage msg) async {
  print("Handling background message: ${msg.data}");
}