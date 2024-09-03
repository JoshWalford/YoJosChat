import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:yojo_chats/provider/auth_provider.dart';
import 'package:yojo_chats/widgets/build_message_input.dart';

class ChatScreen extends StatefulWidget {
  final String receiverUserPhoneNumber;
  final String receiverUserID;

  const ChatScreen({
    super.key,
    required this.receiverUserPhoneNumber,
    required this.receiverUserID,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/contactScreen');
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
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.cyan.shade200,
                      backgroundImage: widget.receiverUserPhoneNumber.isNotEmpty
                          ? NetworkImage(ap.userModel.profilePic)
                          : null,
                    ),
                    const SizedBox(width: 5),
                    Text(widget.receiverUserPhoneNumber),
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
        body: const MessageInput(
          receiverUserPhoneNumber: '',
          receiverUserID: '',
        ));
  }
}
