import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderPhoneNumber;
  final String receiverId;
  final String message;
  final Timestamp timestamp;
  final String? imageUrl;
  final bool isRead;

  Message({
    required this.senderId,
    required this.senderPhoneNumber,
    required this.receiverId,
    required this.timestamp,
    required this.message,
    required this.imageUrl,
    this.isRead = false,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
        senderId: map ['senderId'],
        senderPhoneNumber: map ['senderPhoneNumber'],
        receiverId: map ['receiverId'],
        timestamp: map ['timestamp'],
        message: map ['message'],
        imageUrl: map ['imageUrl']);
  }
  // convert to a map
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderPhoneNumber': senderPhoneNumber,
      'receiverId': receiverId,
      'timestamp': timestamp,
      'message': message,
      'imageUrl': imageUrl,
      'isRead': isRead,
    };
  }
}
