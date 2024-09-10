import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yojo_chats/firebase_options.dart';
import 'package:yojo_chats/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:yojo_chats/screens/chat_screen.dart';
import 'package:yojo_chats/screens/home_screen.dart';
import 'package:yojo_chats/screens/auth/login_screen.dart';
import 'package:yojo_chats/screens/auth/otp_screen.dart';
import 'package:yojo_chats/services/auth_gate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
        create: (context) => AuthProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yojo\'s Chat',
        home: const AuthGate(),
        //WelcomeScreen(),

        routes: {
          'loginScreen': (context) => const LoginScreen(),
          'oTpScreen': (context) => const OTPScreen(verificationId: ''),
          'homeScreen': (context) => const HomeScreen(),
          'chatScreen': (context) => const ChatScreen(
                receiverUserPhoneNumber: '',
                receiverUserID: '',
              ),
        },
      ),
    );
  }
}
