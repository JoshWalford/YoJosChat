import 'package:flutter/material.dart';
import 'package:yojo_chats/screens/auth_screen.dart';
import 'package:yojo_chats/screens/chat_screen.dart';
import 'package:yojo_chats/screens/contacts_screen.dart';
import 'package:yojo_chats/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),

      initialRoute: '/',
      routes: {
        '/authScreen': (context) => const AuthScreen(),
        '/contactsScreen': (context) => const ContactsScreen(),
        '/chatScreen': (context) => const ChatScreen(),
      }
    );
  }
}

