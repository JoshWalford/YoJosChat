import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yojo_chats/widgets/message_widgets/build_message_input.dart';

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
  Map<String, dynamic>? receiverData; // To store the receiver's data

  @override
  void initState() {
    super.initState();
    _loadReceiverData();
  }

  Future<void> _loadReceiverData() async {
    try {
      DocumentSnapshot receiverSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.receiverUserID)
          .get();

      if (receiverSnapshot.exists && receiverSnapshot.data() != null) {
        setState(() {
          receiverData = receiverSnapshot.data() as Map<String, dynamic>;
        });
      } else {
        print("Receiver data not found");
      }
    } catch (e) {
      print("Error loading receiver data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.cyan.shade200,
              backgroundImage: receiverData != null &&
                  receiverData!['profilePic'] != null &&
                  receiverData!['profilePic'].isNotEmpty
                  ? NetworkImage(receiverData!['profilePic'])
                  : null,
              child: receiverData == null ||
                  receiverData!['profilePic'] == null ||
                  receiverData!['profilePic'].isEmpty
                  ? Text(
                widget.receiverUserPhoneNumber[0].toUpperCase(),
                style: const TextStyle(
                    color: Colors.white, fontSize: 10),
              )
                  : null,
            ),
            const SizedBox(width: 10),
            Text(
              widget.receiverUserPhoneNumber,
              style: const TextStyle(
                  color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {
                // More options functionality
              },
              icon: const Icon(Icons.more_vert_outlined),
            ),
          ],
        ),
        elevation: 5.0,
        backgroundColor: Colors.cyan.shade200,
        shadowColor: Colors.black,
      ),
      body: receiverData == null
          ? const Center(child: CircularProgressIndicator())
          : MessageInput(
        receiverUserPhoneNumber: widget.receiverUserPhoneNumber,
        receiverUserID: widget.receiverUserID,
      ),
    );
  }
}
