// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasepractise/Johannes_Milke/Home_page/Home_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {
 
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height / 8,
                width: double.infinity,
                color: Colors.blue[800],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Messages",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () {
                        viewModel.signOut(context);
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('chat/JqUn09VGGydOx5WvzAWw/messages')
                    .orderBy('datetime', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  return Expanded(
                    child: snapshot.connectionState == ConnectionState.waiting
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            reverse: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.bottomLeft,
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: snapshot.data!.docs[index]
                                                  ['userId'] ==
                                              auth.currentUser!.uid
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Text(
                                          snapshot.data!.docs[index]['message'],
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment: snapshot.data!
                                                  .docs[index]['userId'] ==
                                             auth.currentUser!.uid
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.start,

                                      children: [
                                        const CircleAvatar(
                                          radius: 20,
                                          backgroundImage:
                                              AssetImage('assets/stumble.jpg'),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          snapshot.data!.docs[index]
                                              ['datetime'],
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                  );
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                      controller: viewModel.messageController,
                      style: const TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () async {
                            FirebaseFirestore.instance
                                .collection(
                                    'chat/JqUn09VGGydOx5WvzAWw/messages')
                                .add(
                              {
                                'message': viewModel.messageController.text,
                                'userId':
                                    FirebaseAuth.instance.currentUser!.uid,
                                'datetime': DateTime.now().toString()
                              },
                            );
                            viewModel.messageController.clear();
                          },
                          icon: const Icon(Icons.send),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        hintText: 'Message',
                        hintStyle: const TextStyle(fontSize: 16),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  FirebaseAuth auth = FirebaseAuth.instance;
