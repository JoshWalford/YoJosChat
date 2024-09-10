import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:google_fonts/google_fonts.dart';

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

    return Container(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
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
              child: Text(
                data['message'],
                style: GoogleFonts.robotoMono(
                  textStyle: TextStyle(
                    color: isSender ? Colors.white : Colors.green,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
