import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yojo_chats/services/chat.dart';
import 'package:yojo_chats/utils/helper/file_picker.dart';
import 'package:yojo_chats/utils/helper/image_sender.dart';
import 'package:yojo_chats/utils/utils.dart';
import 'package:yojo_chats/widgets/message_widgets/build_message_list.dart';

class MessageInput extends StatefulWidget {
  final String receiverUserPhoneNumber;
  final String receiverUserID;

  const MessageInput(
      {super.key,
      required this.receiverUserPhoneNumber,
      required this.receiverUserID});

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final ImageSender imageSender = ImageSender();
  final FilePickerHelper filePickerHelper =  FilePickerHelper();
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(() {
      setState(() {
        _isTyping = _messageController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void sendMessage() async {
    // only send message if there is something to send
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserID, _messageController.text);
      //clear the text controller after sending the message
      _messageController.clear();
    }
  }

  void sendImageMessage(File image) async {
    try {
      await _chatService.sendChatImage(widget.receiverUserID, image);
      showSnackBar(context, 'Image sent successfully');
    } catch (e) {
      showSnackBar(context, 'Unable to send image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BuildMessageList(
              chatService: _chatService,
              widget: widget,
              firebaseAuth: _firebaseAuth),
        ),
        _buildMessageInput(),
        const SizedBox(height: 25),
      ],
    );
  }
  // build message input
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () async {
              File? image = await imageSender.pickImageFromGallery();
              if (image != null) {
                sendImageMessage(image);  // Send the picked image
              } else {
                showSnackBar(context, 'No image selected');
              }
            },
            icon: Icon(
              Iconsax.gallery_add,
              color: Colors.cyan.shade200,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: Icon(
              Icons.send,
              color: Colors.cyan.shade200,
            ),
          ),
        ],
      ),
    );
  }
}