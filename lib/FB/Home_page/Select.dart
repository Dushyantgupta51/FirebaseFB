// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  const Select({super.key});

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  Map<String, dynamic> userMap = {};
  bool isLoading = false;
  TextEditingController search = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    setState(
      () {
        isLoading = true;
      },
    );
    await firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({'email': FirebaseAuth.instance.currentUser!.email}).then(
      (value) {
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
              child: const Text("data"),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Search"),
              controller: search,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
              onPressed: () {
                onSearch();
              },
              icon: const Icon(Icons.search),
              label: const Text("Search"),
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection('uid')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .set(
                            {'uid': FirebaseAuth.instance.currentUser},
                          ).then(
                            (value) {},
                          );
                        },
                        title: Text(
                          snapshot.data!.docs[index]['email'],
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            // ignore: unnecessary_null_comparison
            // userMap['name'] != null
            //     ? ListTile(
            //         onTap: () {
            //           String roomId = chatRoomId(
            //             auth.currentUser!.displayName!,
            //             userMap['name'],
            //           );
            //           Navigator.of(context).push(
            //             MaterialPageRoute(
            //               builder: (context) =>
            //                   ChatHere(chatRoomId: roomId, userMap: userMap),
            //             ),
            //           );
            //         },
            //         leading: const Icon(
            //           Icons.account_box,
            //           color: Colors.black,
            //         ),
            //         title: Text(
            //           userMap['name'],
            //           style: const TextStyle(
            //               color: Colors.black,
            //               fontSize: 17,
            //               fontWeight: FontWeight.bold),
            //         ),
            //       )
            //     : Container(),
          ],
        ),
      ),
    );
  }
}
