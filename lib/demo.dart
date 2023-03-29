// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';

// class Demo extends StatelessWidget {
//   const Demo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text("Second Screen")),
//         body: const Center(child: Text("Hello world here it is")));
//   }
// }
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final String id;
  const MessageScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Screen'),
      ),
      body: Center(
        child: Text(widget.id),
      ),
    );
  }
}
