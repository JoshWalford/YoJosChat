
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../provider/auth_provider.dart';
import '../../screens/chat_screen.dart';

class BuilderUserListItem extends StatelessWidget {
  const BuilderUserListItem({
    super.key,
    required this.context,
    required this.document,
    required this.ap,
  });

  final BuildContext context;
  final DocumentSnapshot<Object?> document;
  final AuthProvider ap;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if (ap.userModel?.phoneNumber == data['phoneNumber']) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: data['profilePic'] != null && data['profilePic'].isNotEmpty
                  ? NetworkImage(data['profilePic'])
                  : const AssetImage('assets/placeholder.jpg') as ImageProvider,
              radius: 25,
            ),
            title: Text('${data['fName']} ${data['lName']}',
              style: const TextStyle(
                fontWeight: FontWeight.w200,
                color: Colors.black54,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen(
                  receiverUserPhoneNumber: '${data['fName']} ${data['lName']}',
                  receiverUserID: data['uid'],
                ),
                ),
              );
            },
          ),
        ),
        Divider(
          thickness: 2,
          height: 1,
          indent: 20,
          endIndent: 20,
          color: Colors.grey.shade200,
        )
      ],
    );
  }
}
