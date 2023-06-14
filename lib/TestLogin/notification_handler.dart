import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';


FirebaseAuth auth = FirebaseAuth.instance;
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

initializaNotification() async{
  final fcm  = FirebaseMessaging.instance;
  debugPrint(
      "Tokenyaaaaa:  ${(await FirebaseMessaging.instance.getToken())}"
  );

  try{
    if(Platform.isIOS){
      await fcm.requestPermission(alert: true,badge: true,sound: true);
      await fcm.setForegroundNotificationPresentationOptions(
          alert: true,badge: true,sound: true);
      FirebaseMessaging.onMessage.listen((event) { });
      FirebaseMessaging.onBackgroundMessage((message) async{});
      FirebaseMessaging.onMessageOpenedApp.listen((event) { });
    }
  }catch(e){
    debugPrint(e.toString());
  }
  FirebaseMessaging.onMessage.listen((_onMessage));
  FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(_onOpened);

  final message = await fcm.getInitialMessage();
  if(message !=null){
    final data = message.data;
    debugPrint("INIIT!!:$data");
  }
}

void _onMessage(RemoteMessage message){
  debugPrint("ONMSG!!: ${message.notification?.title})");
  debugPrint("${message.notification?.body}");
  RemoteNotification? notifications =message.notification;
  AndroidNotification? android =message.notification?.android;
  if(notifications != null && android != null){
    flutterLocalNotificationsPlugin.show(
      notifications.hashCode,
      notifications.title,
      notifications.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          color: Colors.blue,
          playSound: true,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }
}

Future<void> _onBackgroundMessage(RemoteMessage message) async{
  debugPrint("ONBG !!:${message.notification?.title}");
  debugPrint("${message.notification?.body}");
}

void _onOpened(RemoteMessage message){
  final data = message.data;
  debugPrint("ONOPENED!!:$data");
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'my_channel',//id
  'My Channel',//title
  importance: Importance.high,
);