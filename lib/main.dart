import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ui_bardi/loginsharedpreference.dart';
import 'firebase_options.dart';
import 'Login_Screen.dart';
import 'beranda.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(UIbardi());
}

class UIbardi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializationNotification();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:LoginScreen(),
    );
  }
}
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugins =
FlutterLocalNotificationsPlugin();

initializationNotification() async{
  final fcm  = FirebaseMessaging.instance;
  debugPrint(
      "Token:  ${(await FirebaseMessaging.instance.getToken())}"
  );

  // try{
  //   if(Platform.isIOS){
  //     await fcm.requestPermission(alert: true,badge: true,sound: true);
  //     await fcm.setForegroundNotificationPresentationOptions(
  //         alert: true,badge: true,sound: true);
  //     FirebaseMessaging.onMessage.listen((event) { });
  //     FirebaseMessaging.onBackgroundMessage((message) async{});
  //     FirebaseMessaging.onMessageOpenedApp.listen((event) { });
  //   }
  // }catch(e){
  //   debugPrint(e.toString());
  // }

  FirebaseMessaging.onMessage.listen((_onMessage));
  FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(_onOpened);

  final message = await fcm.getInitialMessage();
  if(message !=null){
    final data = message.data;
    debugPrint("INIITIALIZATION:$data");
  }
}

void _onMessage(RemoteMessage message){
  debugPrint("ONMESSAGE: ${message.notification?.title})");
  debugPrint("${message.notification?.body}");
  RemoteNotification? notifications =message.notification;
  AndroidNotification? android =message.notification?.android;
  if(notifications != null && android != null){
    flutterLocalNotificationsPlugins.show(
      notifications.hashCode,
      notifications.title,
      notifications.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          color: Colors.cyan,
          playSound: true,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }
}

Future<void> _onBackgroundMessage(RemoteMessage message) async{
  debugPrint("ONBACKGOUND !!:${message.notification?.title}");
  debugPrint("${message.notification?.body}");
}

void _onOpened(RemoteMessage message){
  final data = message.data;
  debugPrint("ONOPENED!!:$data");
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'bari_smarthome',//id
  'BARDI SMART HOME',//title
  importance: Importance.high,
);



