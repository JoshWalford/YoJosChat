import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/chat.dart';
import 'build_message_item.dart';
import 'build_message_input.dart';

class BuildMessageList extends StatelessWidget {
  const BuildMessageList({
    super.key,
    required ChatService chatService,
    required this.widget,
    required FirebaseAuth firebaseAuth,
  }) : _chatService = chatService, _firebaseAuth = firebaseAuth;

  final ChatService _chatService;
  final MessageInput widget;
  final FirebaseAuth _firebaseAuth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _chatService.getMessage(
          widget.receiverUserID, _firebaseAuth.currentUser!.uid),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Text('No message yet');
        }

        return ListView.builder(
          reverse: false,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return BuildMessageItem(firebaseAuth: _firebaseAuth, context: context, document: snapshot.data!.docs[index]);
          },
        );
      },
    );
  }
}
