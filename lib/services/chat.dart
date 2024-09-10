import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:yojo_chats/model/message.dart';

class ChatService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // SEND MESSAGE
  Future<void> sendMessage(String receiverId, String message) async {
    // Get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final Timestamp timestamp = Timestamp.now();

    // Construct chat room ID from current user ID and receiver ID (sorted to ensure uniqueness)
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    // Create or update the chat room document
    await _fireStore.collection('chat_rooms').doc(chatRoomId).set({
      'lastMessage': message,
      'lastTimestamp': timestamp,
      // You can add more fields here if needed
    }, SetOptions(merge: true)); // Use merge to avoid overwriting existing data

    // Create a new message
    Message newMessage = Message(
      senderId: currentUserId,
      senderPhoneNumber: _firebaseAuth.currentUser!.phoneNumber.toString(),
      receiverId: receiverId,
      timestamp: timestamp,
      message: message,
    );

    // Add new message to database
    await _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // GET MESSAGE
  Stream<QuerySnapshot> getMessage(String userId, String otherUserId) {
    // Construct chat room ID from user IDs
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}