import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:yojo_chats/model/message.dart';

class ChatService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // SEND MESSAGE
  Future<void> sendMessage(String receiverId, String message, {String? imageUrl}) async {
    // Get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final Timestamp timestamp = Timestamp.now();

    // Construct chat room ID from current user ID and receiver ID (sorted to ensure uniqueness)
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    // Create or update the chat room document
    await _fireStore.collection('chat_rooms').doc(chatRoomId).set({
      'lastMessage': message.isEmpty && imageUrl != null ? 'Image' : message,
      'lastTimestamp': timestamp,
    }, SetOptions(merge: true)); // Use merge to avoid overwriting existing data

    // Create a new message
    Message newMessage = Message(
      senderId: currentUserId,
      senderPhoneNumber: _firebaseAuth.currentUser!.phoneNumber.toString(),
      receiverId: receiverId,
      timestamp: timestamp,
      message: message,
      imageUrl: imageUrl,
    );

    // Add new message to chat room's messages subcollection
    await _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // Upload File to Firebase Storage
  Future<String> uploadFile(File image, String fileName) async {
    Reference reference = _storage.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  // Function to send chat image
  Future<void> sendChatImage(String receiverId, File imageFile) async {
    try {
      // Upload image to Firebase Storage
      final ref = FirebaseStorage.instance
          .ref()
          .child('chatImages/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await ref.putFile(imageFile);

      // Get the download URL
      final imageUrl = await ref.getDownloadURL();

      // Send the image message using sendMessage method
      await sendMessage(receiverId, '', imageUrl: imageUrl);
    } catch (e) {
      throw Exception('Failed to send image message: $e');
    }
  }

  // UPDATE MESSAGE READ STATUS
  Future<void> updateMessageReadStatus(Message message) async {
    List<String> ids = [message.senderId, message.receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    await _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .where('timestamp', isEqualTo: message.timestamp)
        .get()
        .then((snapshot) {
      for (var doc in snapshot.docs) {
        doc.reference.update({'isRead': true});
      }
    });
  }
  // GET MESSAGE
  Stream<QuerySnapshot> getMessage(String userId, String otherUserId) {
    // Construct chat room ID from user IDs
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    // Mark unread messages as read
    _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .where('receiverId', isEqualTo: userId)
        .where('isRead', isEqualTo: false)
        .get()
        .then((snapshot) {
      for (var doc in snapshot.docs) {
        doc.reference.update({'isRead': true});
      }
    });

    // Return the messages stream ordered by timestamp
    return _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
