import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderPhoneNumber;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderId,
    required this.senderPhoneNumber,
    required this.receiverId,
    required this.timestamp,
    required this.message,
  });

  // convert to a map
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderPhoneNumber': senderPhoneNumber,
      'receiverId': receiverId,
      'timestamp': timestamp,
      'message': message,
    };
  }
}
