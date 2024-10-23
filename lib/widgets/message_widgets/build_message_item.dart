import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yojo_chats/utils/helper/my_date_util.dart';

class BuildMessageItem extends StatelessWidget {
  const BuildMessageItem({
    super.key,
    required FirebaseAuth firebaseAuth,
    required this.context,
    required this.document,
  }) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;
  final BuildContext context;
  final DocumentSnapshot<Object?> document;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    bool isSender = data['senderId'] == _firebaseAuth.currentUser!.uid;
    int timestamp = data['timestamp'].millisecondsSinceEpoch;

    return Container(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          ChatBubble(
            clipper: isSender
                ? ChatBubbleClipper9(type: BubbleType.sendBubble)
                : ChatBubbleClipper9(type: BubbleType.receiverBubble),
            alignment: isSender ? Alignment.topRight : Alignment.topLeft,
            margin: const EdgeInsets.only(top: 20),
            backGroundColor: isSender ? Colors.cyan : Colors.grey.shade200,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Check if the message contains an image
                  if (data['imageUrl'] != null && data['imageUrl'].isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Image.network(
                        data['imageUrl'],
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (data['message'] != null && data['message'].isNotEmpty)
                    Text(
                      data['message'],
                      style: GoogleFonts.robotoMono(
                        textStyle: TextStyle(
                          color: isSender ? Colors.white : Colors.green,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  Text(
                    MyDateUtil.geFormattedTime(
                      context: context,
                      time: timestamp,
                    ),
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}