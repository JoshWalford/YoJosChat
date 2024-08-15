import 'package:flutter/material.dart';
import 'package:yojo_chats/widgets/build_message_input.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/placeholder.jpg'),
            ),
            SizedBox(width: 10),
            Text('Recipient name'),
            SizedBox(width: 35),
            Icon(Icons.phone_outlined),
            Icon(Icons.more_vert)
          ],
        ),
        elevation: 5.0,
        backgroundColor: Colors.cyan.shade200,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10.0),
                children: const [
                  /// TODO
                ],
              ),
          ),
          buildMessageInput(),
        ],
      ),
    );
  }
}

