import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderPhoneNumber;
  final String receiverId;
  final String message;
  final Timestamp timeStamp;

  Message({
    required this.senderId,
    required this.senderPhoneNumber,
    required this.receiverId,
    required this.timeStamp,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderPhoneNumber': senderPhoneNumber,
      'receiverId': receiverId,
      'timeStamp': timeStamp,
      'message': message,
    };
  }
}
