import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yojo_chats/screens/chat_screen.dart';

import '../provider/auth_provider.dart';

class ContactsListView extends StatefulWidget {
  const ContactsListView({super.key});

  @override
  State<ContactsListView> createState() => _ContactsListViewState();
}

class _ContactsListViewState extends State<ContactsListView> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return ListView(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatScreen()),
            );
          },
          child: ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(ap.userModel.profilePic)
            ),
            title: Text('${ap.userModel.fName} ${ap.userModel.lName}'),
            subtitle: const Text('Message sent to user'),
          ),
        ),
        const Divider(height: 5),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatScreen()),
            );
          },
          child: const ListTile(
            leading: CircleAvatar(
                backgroundImage: AssetImage('placeholder.jpg')),
            title: Text('Username'),
            subtitle: Text('Message sent to user'),
          ),
        ),
        const Divider(height: 0),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatScreen()),
            );
          },
          child: const ListTile(
            leading: CircleAvatar(
                backgroundImage: AssetImage('placeholder.jpg')),
            title: Text('Username'),
            subtitle: Text('Message sent to user'),
          ),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
