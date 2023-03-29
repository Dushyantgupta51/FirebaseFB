// // ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:firebasepractise/secondScreen.dart';
// import 'package:flutter/material.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp().whenComplete(() => print('success'));
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Links',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const MyHomePage(title: 'Deep Linking'),
//         routes: {'secondScreen': (context) => const secondScreen()});
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     initDynamicLinks(context);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             backgroundColor: Colors.deepPurpleAccent,
//             title: Text(widget.title)),
//         body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                   child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Container(
//                           padding: const EdgeInsets.all(16),
//                           height: 200,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(18),
//                               color: Colors.deepPurpleAccent),
//                           child: Center(
//                               child: Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                   children: [
//                                 Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .spaceBetween,
//                                     children: const [
//                                       Text('Name: Dushyant Gupta',
//                                           style: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight:
//                                                   FontWeight.bold,
//                                               color: Colors.white))
//                                     ]),
//                                 const SizedBox(height: 20),
//                                 const Text(
//                                     'Email: dushyantg51@gmail.com',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white)),
//                                 const SizedBox(height: 20),
//                                 const Text("Ph. : 9351887098",
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white))
//                               ])))))
//             ]));
//   }
// }

// ignore_for_file: avoid_print, unused_local_variable

// void initDynamicLinks(context) async {
//   final PendingDynamicLinkData? initialLink =
//       await FirebaseDynamicLinks.instance.getInitialLink();
//   final Uri? deepLink = initialLink?.link;
//   if (deepLink != null) {
//     print("deeplink data" + deepLink.toString());
//     Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => const secondScreen()));
//   }
// }

// import 'dart:convert';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp().whenComplete(() => print('success'));

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Server Driven UI',
//         home: SecHomePage());
//   }
// }

// class SecHomePage extends StatefulWidget {
//   const SecHomePage({super.key});

//   @override
//   State<SecHomePage> createState() => _SecHomePageState();
// }

// class _SecHomePageState extends State<SecHomePage> {
//   List<Widget> serverWidgets = [];

//   @override
//   void initState() {
//     super.initState();
//     getVal();
//   }

//   getVal() async {
//     var serverJsonList =
//         (await FirebaseRemoteConfigClass().initalizeConfig());
//     setState(() {
//       serverWidgets = MapDataToWidget().mapWidgets(serverJsonList);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Server Driven UI"),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [...serverWidgets],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebasepractise/notificationservice/local_notification_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel', //id
//     'High Importance Notifications', // title
//     importance: Importance.high,
//     playSound: true);

// final FlutterLocalNotificationsPlugin
//     flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
// Future<void> firebaseMessagingBackgroundHandler(
//     RemoteMessage message) async {
//   print('A bg message just showed up : ${message.messageId}');
// }

// Future<void> backroundHandler(RemoteMessage message) async {
//   print(message.data.toString());
//   print(message.notification!.title);
// }

// Future<void> main(context) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   FirebaseMessaging.onBackgroundMessage(backroundHandler);
//   // LocalNotificationService.initLocalNotification(context);

//   // await FirebaseMessaging.instance.getInitialMessage();
//   // FirebaseMessaging.onBackgroundMessage(
//   //     _firebaseMessagingBackgroundHandler);

//   // await flutterLocalNotificationsPlugin
//   //     .resolvePlatformSpecificImplementation<
//   //         AndroidFlutterLocalNotificationsPlugin>()
//   //     ?.createNotificationChannel(channel);

//   // await FirebaseMessaging.instance
//   //     .setForegroundNotificationPresentationOptions(
//   //         alert: true, badge: true, sound: true);

//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             NotificationDetails(
//                 android: AndroidNotificationDetails(
//                     channel.id, channel.name,
//                     color: Colors.blue,
//                     playSound: true,
//                     icon: '@mipmap/ic_launcher')));
//       }
//     });
//     FirebaseMessaging.onMessageOpenedApp
//         .listen((RemoteMessage message) {
//       // Navigator.of(context).push(MaterialPageRoute(
//       //   builder: (context) => const SecondforTesting(),
//       // ));
//       print('A new onMessageOpenedApp event was published!');

//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                   title: Text(notification.title.toString()),
//                   content: SingleChildScrollView(
//                       child: Column(
//                           crossAxisAlignment:
//                               CrossAxisAlignment.start,
//                           children: [
//                         Text(notification.body.toString())
//                       ])));
//             });
//       }
//     });
//   }

//   void showNotification() {
//     setState(() {});
//     flutterLocalNotificationsPlugin.show(
//         0,
//         "Firebase Notificationl",
//         "Button Pressed Succesfully !",
//         NotificationDetails(
//             android: AndroidNotificationDetails(
//                 channel.id, channel.name,
//                 importance: Importance.high,
//                 color: Colors.blue,
//                 playSound: true,
//                 icon: '@mipmap/ic_launcher')));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             appBar: AppBar(title: const Text("Push Notification")),
//             body: Center(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                   Text('You have pushed the button this many times:')
//                 ])),
//             floatingActionButton: FloatingActionButton(
//                 onPressed: showNotification,
//                 tooltip: 'Increment',
//                 child: const Icon(Icons.add))));
//   }
// }
//////////////////////////////////////////
///
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebasepractise/notificationservice/local_notification_service.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(
      _firebaseMessagingBackgroundHandler);
  NotificationServices().getDeviceToken();
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen());
  }
}



// class FirebaseRemoteConfigClass {
//   final remoteConfig = FirebaseRemoteConfig.instance;
//   Future initalizeConfig() async {
//     await remoteConfig.setConfigSettings(RemoteConfigSettings(
//         fetchTimeout: const Duration(seconds: 1),
//         minimumFetchInterval: const Duration(seconds: 1)));
//     await remoteConfig.fetchAndActivate();
//     var temp = remoteConfig.getString('DynamicWidget');
//     return temp;
//   }
// }

// class MapDataToWidget {
//   List<Widget> serverWidgets = [];
//   mapWidgets(serverUI) {
//     for (var element in jsonDecode(serverUI)) {
//       String type = element['type'];
//       serverWidgets.add(toWidgets(element, type));
//     }
//     return serverWidgets;
//   }

//   toWidgets(element, type) {
//     switch (type) {
//       case 'FlutterLogo':
//         return FlutterLogo(
//           size: (element['size']).toDouble(),
//         );
//       case 'Container':
//         return Container(
//           width: (element['width']).toDouble(),
//           height: (element['height']).toDouble(),
//           color: HexColor(element['color']),
//           child: toWidgets(
//               element['attributes'], element['attributes']['type']),
//         );
//       case 'Text':
//         return Text(element['txtData']);
//       default:
//         return (const Text("error"));
//     }
//   }
// }
