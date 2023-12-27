import 'package:flutter/material.dart';

enum PopupItem { edit, sort, view }

class PopupMenu extends StatefulWidget {
  const PopupMenu({super.key});

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  PopupItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) => setState(() {
        selectedItem = value;
      }),
      itemBuilder: (context) => <PopupMenuEntry<PopupItem>>[
        PopupMenuItem(
          value: PopupItem.edit,
          child: Text('Edit', style: Theme.of(context).textTheme.labelLarge),
        ),
        PopupMenuItem(
          value: PopupItem.sort,
          child: Text('Sort', style: Theme.of(context).textTheme.labelLarge),
        ),
        PopupMenuItem(
          value: PopupItem.view,
          child: Text('View', style: Theme.of(context).textTheme.labelLarge),
        ),
      ],
    );
  }
}
