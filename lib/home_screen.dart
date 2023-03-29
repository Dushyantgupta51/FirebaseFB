// // ignore_for_file: avoid_print

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebasepractise/demo.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'notificationservice/local_notification_service.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     //1st method (app is terminated)
//     FirebaseMessaging.instance.getInitialMessage().then((message) => {
//           print("FirebaseMessaging.instance.getInitialMessage"),
//           if (message != null)
//             {
//               print("New notification"),
//               if (message.data['_id'] != null &&
//                   message.data['_id'] == null)
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => const Demo()))
//             }
//         });
// //2nd method (app opened)
//     void firebaseInit(BuildContext context){
//        FirebaseMessaging.onMessage.listen((message) {
//       print("FirebaseMessaging.onMessage.listen");
//       try {
//         if (message.notification != null) {
//           print(message.notification!.title);
//           print(message.notification!.body);
//           print("message.data11 ${message.data}");

//           LocalNotificationService.initLocalNotification(message);
//         }
//       } catch (_) {}
//     });

//     }

//       Future<void> showNotification(RemoteMessage message)async{

//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//         message.notification!.android!.channelId.toString(),
//       message.notification!.android!.channelId.toString() ,
//       importance: Importance.max  ,
//       showBadge: true ,
//     );

//     //3rd method (app running in background)
//     FirebaseMessaging.onMessageOpenedApp
//         .listen((RemoteMessage message) {
//       print("FirebaseMessaging.onMessageOpenedApp.listen");
//       if (message.notification != null) {
//         print(message.notification!.title);
//         print(message.notification!.body);
//         print("message.data22 ${message.data['_id']}");
//       }
//     });
//   }

// ignore_for_file: depend_on_referenced_packages

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text("Notification")),
//         body: Center(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [Text("Home Page")])));
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'notificationservice/local_notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notifications'),
      ),
      body: const Center(child: Text("Hello world")),
    );
  }
}
