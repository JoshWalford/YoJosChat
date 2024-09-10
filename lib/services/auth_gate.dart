import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yojo_chats/screens/home_screen.dart';
import 'package:yojo_chats/screens/auth/login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
             /// User logged in
            if (snapshot.hasData) {
              return const HomeScreen();
            } else {
              /// User not logged in
              return const LoginScreen();
            }
          },
      ),
    );
  }
}
