import 'package:flutter/material.dart';
import 'package:yojo_chats/screens/chat_screen.dart';
import 'package:yojo_chats/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),

      initialRoute: '/loginScreen',

      routes: {
        '/chatScreen': (context) => const ChatScreen(),
      }
    );
  }
}

