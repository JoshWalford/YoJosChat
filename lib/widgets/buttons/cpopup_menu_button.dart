import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:yojo_chats/screens/contacts_screen.dart';
import 'package:yojo_chats/screens/welcome_screen.dart';

import '../../provider/auth_provider.dart';
import '../../utils/enum/menuItem.dart';

class CPopupMenu extends StatefulWidget {
  const CPopupMenu({super.key});

  @override
  State<CPopupMenu> createState() => _CPopupMenuState();
}

class _CPopupMenuState extends State<CPopupMenu> {
  MenuItems? selectedItem;

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return PopupMenuButton<MenuItems>(
      icon: const Icon(Icons.more_vert),
      initialValue: selectedItem,
      onSelected: (MenuItems item) {
        setState(() {
          selectedItem = item;
        });
        switch (item) {
          case MenuItems.about:
          // TODO: Handle this case.
          case MenuItems.settings:
          // TODO: Handle this case.
          case MenuItems.logout:
            ap.userSignOut().then(
                  (value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                  ),
                );
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItems>>[
        const PopupMenuItem<MenuItems>(
          value: MenuItems.about,
          child: ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
          ),
        ),
        const PopupMenuItem<MenuItems>(
          value: MenuItems.settings,
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
          ),
        ),
        const PopupMenuItem<MenuItems>(
          value: MenuItems.logout,
          child: ListTile(
            leading: Icon(Iconsax.logout),
            title: Text('Logout'),
          ),
        ),
      ],
    );
  }
}
