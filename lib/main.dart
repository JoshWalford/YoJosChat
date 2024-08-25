import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yojo_chats/provider/auth_provider.dart';
import 'package:yojo_chats/screens/user_info_screen.dart';
import 'package:yojo_chats/screens/welcome_screen.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: //UserInfoScreen(),
        WelcomeScreen(),
        title: 'Yojo\'s Chat',
      ),
    );
  }
}

