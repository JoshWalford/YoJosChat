import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/otpScreen');
          },
          icon: const Icon(Icons.arrow_back),
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/chatScreen');
              },
              child: const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/placeholder.jpg'),
                  ),
                  SizedBox(width: 10),
                  Text('Name'),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.call),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_outlined),
                ),
              ],
            ),
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
