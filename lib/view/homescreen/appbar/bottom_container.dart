import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/view/homescreen/appbar/popup_menu.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      bottom: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => onDrawerIconPressed(context),
                icon: const Icon(FontAwesomeIcons.bars),
              );
            }
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.magnifyingGlass)),
          const PopupMenu()
        ],
      ),
    );
  }

  void onDrawerIconPressed(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
