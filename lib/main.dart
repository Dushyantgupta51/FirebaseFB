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

// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(() => print('success'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Server Driver UI',
      home: SecHomePage(),
    );
  }
}

class SecHomePage extends StatefulWidget {
  const SecHomePage({super.key});

  @override
  State<SecHomePage> createState() => _SecHomePageState();
}

class _SecHomePageState extends State<SecHomePage> {
  List<Widget> serverWidgets = [];

  @override
  void initState() {
    super.initState();
    getVal();
  }

  getVal() async {
    var serverJsonList = (await FirebaseRemoteConfigClass().initalizeConfig());
    setState(() {
      serverWidgets = MapDataToWidget().mapWidgets(serverJsonList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Server Driven UI"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [...serverWidgets],
          ),
        ),
      ),
    );
  }
}

class FirebaseRemoteConfigClass {
  final remoteConfig = FirebaseRemoteConfig.instance;

  Future initalizeConfig() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 1),
        minimumFetchInterval: const Duration(seconds: 1)));
    await remoteConfig.fetchAndActivate();
    var temp = remoteConfig.getString('DynamicWidget');
    return temp;
  }
}

class MapDataToWidget {
  List<Widget> serverWidgets = [];
  mapWidgets(serverUI) {
    for (var element in jsonDecode(serverUI)) {
      String type = element['type'];
      serverWidgets.add(toWidgets(element, type));
    }
    return serverWidgets;
  }

  toWidgets(element, type) {
    switch (type) {
      case 'FlutterLogo':
        return FlutterLogo(
          size: (element['size']).toDouble(),
        );
      case 'Container':
        return Container(
          width: (element['width']).toDouble(),
          height: (element['height']).toDouble(),
          color: HexColor(element['color']),
          child:
              toWidgets(element['attributes'], element['attributes']['type']),
        );
      case 'Text':
        return Text(element['txtData']);
      default:
        return (const Text("error"));
    }
  }
}
