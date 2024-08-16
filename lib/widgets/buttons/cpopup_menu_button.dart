import 'package:flutter/material.dart';

class CPopupMenuButton extends StatefulWidget {
  const CPopupMenuButton({Key? key}) : super(key: key);

  @override
  State<CPopupMenuButton> createState() => _CPopupMenuButtonState();
}

class _CPopupMenuButtonState extends State<CPopupMenuButton> {
  var selectedItem = '';

  void _showPopupMenu(BuildContext context) async {
    final RenderBox top = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    final Offset offset = top.localToGlobal(Offset.zero, ancestor: overlay);
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromLTWH(
          offset.dx,
          offset.dy + top.size.height,
          top.size.width,
          top.size.height,
        ),
        Offset.zero & overlay.size,
      ),
      items: [
        const PopupMenuItem<String>(
          value: '/about',
          child: Text('About'),
        ),
        const PopupMenuItem<String>(
          value: '/settings',
          child: Text('Settings'),
        ),
      ],
    );

    if (selected != null) {
      setState(() {
        selectedItem = selected;
      });
      Navigator.pushNamed(context, selected);
    }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

//   void showPopupMenu(BuildContext context) async {
//     final RenderBox button = context.findRenderObject() as RenderBox;
//     final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
//
//     final Offset offset = button.localToGlobal(Offset.zero, ancestor: overlay);
//     final selected = await showMenu<String>(
//       context: context,
//       position: RelativeRect.fromRect(
//         Rect.fromLTWH(
//           offset.dx,
//           offset.dy + button.size.height,
//           button.size.width,
//           button.size.height,
//         ),
//         Offset.zero & overlay.size,
//       ),
//       items: [
//         const PopupMenuItem<String>(
//           value: '/about',
//           child: Text('About'),
//         ),
//         const PopupMenuItem<String>(
//           value: '/settings',
//           child: Text('Settings'),
//         ),
//       ],
//     );
//
//     if (selected != null) {
//       Navigator.pushNamed(context, selected);
//     }
//   }
// }
//
//
